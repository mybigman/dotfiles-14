# Criador: Felipe Facundes
# Telegram: @FeFacundes
# Telegram: @FranklinTech
# Um script para converter M4A para MP3
for i in *.[mM][4][aA];
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" -acodec libmp3lame -vn -n "${name}.mp3";
done
echo "Finalizado!!!"
