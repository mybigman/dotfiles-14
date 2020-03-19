#!/usr/bin/env node
const cloudscraper = require("cloudscraper");
const download = require("./download");
const isUrl = require("url-regex");
const signale = require("signale");
const colors = require("colors/safe");
const { torrentIndexer, config } = require("./indexer");
const { prompt } = require("prompts");
const { orderBy } = require("lodash");

// check and notify about update every 24hrs
const updateCheck = require("./updateCheck");
const pkg = require("./package.json");
updateCheck(pkg);

let isCli = true;

const onCancel = prompt => {
  signale.info("Cancelado");
  process.exit();
};

const torrenter = async (query, path = config.path) => {
  // Advanced search
  try {
    let torrents, answers, link, isTorrent;

    if (!query) {
      let { value } = await prompt(
        [
          {
            type: "text",
            name: "value",
            message: "Pesquisa: Magnet ou Link:",
            validate: q => (q ? true : false)
          }
        ],
        {
          onCancel
        }
      );
      query = value;
    }

    if (query.startsWith("magnet:?")) {
      isTorrent = true;
      link = query;
    } else if (isUrl({ exact: true }).test(query)) {
      isTorrent = true;
      link = query;
    }

    if (!isTorrent) {
      console.log("");
      let { type } = await prompt({
        type: "select",
        name: "type",
        message: "Selecione o tipo",
        choices: [
          { title: "Todos", value: "all" },
          { title: "Filmes", value: "movie" },
          { title: "Séries", value: "series" },
          { title: "Anime", value: "anime" },
          { title: "Músicas", value: "music" }
        ],
        initial: 0
      });

      signale.await(`Proucurando por ${query}`);
      data = await torrentIndexer.search(query, type);

      // orderBy seed and quality
      torrents = orderBy(
        data,
        ["score", "resolution", "seeders"],
        ["desc", "desc", "desc"]
      );
      signale.info(`Encontrado ${torrents.length} torrents\n`);

      if (torrents.length < 1) {
        if (isCli) torrenter();
        return;
      }

      answers = await prompt(
        [
          {
            type: "select",
            name: "torrent",
            message: "Select a torrent:",
            choices: torrents.map(item => {
              item.description = colors.brightYellow(
                "\n" +
                  Object.keys(item)
                    .map(key => {
                      if (key == "link" && item[key].length > 60) {
                        return `${key}: ${item[key]
                          .toString()
                          .substring(0, 55)}...`;
                      }
                      return `${key}: ${item[key]}`;
                    })
                    .join("\n") +
                  "\n"
              );
              item.value = item;
              item.title =
                item.fileName.length > 75
                  ? `${item.fileName.substring(0, 70)}...`
                  : item.fileName;
              item.title += colors.yellow(
                `\n    ╚ Tamanho: ${item.size}, Seeders: ${
                  item.seeders
                }, Verificado: ${item.verified || "Desconhecido"}`
              );
              return item;
            }),
            initial: 0
          }
        ],
        {
          onCancel
        }
      );

      if (!answers.torrent.link && answers.torrent.site) {
        link = await torrentIndexer.torrent(answers.torrent.site);
      } else {
        link = answers.torrent.link;
      }
    }

    if (isUrl({ exact: true }).test(link)) {
      if (link.includes("itorrents.org/torrent/")) {
        let hash = link.match(/torrent\/(.*?)\.torrent/);
        link = hash[1];
      } else {
        let { body } = await cloudscraper.get(link);
        link = body;
      }
    }

    const downloads = await download(link, path);
    signale.success("Arquivo salvo em " + colors.cyan(downloads.path));
    if (isCli) torrenter();
    return downloads;
  } catch (error) {
    signale.fatal(error);
    if (isCli) torrenter();
  }
};

// check if using cli
if (require.main === module) {
  // App info
  console.log(
    colors.cyan(
      "\n╔══════════════════════════════════════════════════════════╗"
    )
  );
  console.log(
    colors.cyan("║") +
      colors.bold.yellow(
        `                  Torrenter (${pkg.version})                       `
      ) +
      colors.cyan("║")
  );
  console.log(
    colors.cyan("╠══════════════════════════════════════════════════════════╣")
  );
  console.log(
    colors.brightRed("   TRADUÇÃO   ") +
      colors.cyan("║") +
      "             Franklin Souza                " +
      colors.cyan("║")
  );
  console.log(
    colors.cyan("╠══════════════════════════════════════════════════════════╣")
  );
  console.log(
    colors.brightRed("   DOAÇÃO     ") +
      colors.cyan("║") +
      " https://sayem.eu.org/donate               " +
      colors.cyan("║")
  );
  console.log(
    colors.cyan("╚══════════════════════════════════════════════════════════╝")
  );

  // CLI
  const args = process.argv.slice(2);
  torrenter(args.join(" "));
} else {
  // Module
  isCli = false;
  module.exports = torrenter;
}
