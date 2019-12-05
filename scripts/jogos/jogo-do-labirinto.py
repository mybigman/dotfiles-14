#!/usr/bin/env python3
# Credit: Franklin Souza
# Telegram: @FranklinTech

"""
Versão em python do jogo "Labirinto" escrito em C pelo colega
SamL
        Versão 0.01
"""

from random import randrange
import time
import os

difficult = {'height': 10, 'width': 30}
y, x = 1, 1
moving = 0


def build(levels):
    height = levels['height']
    width = levels['width']
    matrix = []
    for line in range(height):
        if line == 0 or line == height - 1:
            matrix.append(['#'] * width)
        elif line == 1:
            matrix.append([' '] * width)
            matrix[line][0] = '#'
            matrix[line][-1] = '#'
        else:
            matrix.append(['#'] * width)
            for column in range(width):
                matrix[line][randrange(1, width - 1)] = ' '
    matrix[-2][width // 2] = ' '
    matrix[-3][width // 2] = ' '
    matrix[-1][width // 2 - 1] = '|'
    matrix[-1][width // 2] = ' '
    matrix[-1][width // 2 + 1] = '|'
    return matrix


def draw(built):
    global y, x, moving
    os.system('clear')
    built[y][x] = '$'
    print('\n\t\tLabirinto Version 0.1\n')
    for line in range(len(built)):
        print('\t\t', end='')
        for column in range(len(built[line])):
            if column != len(built[line]) - 1:
                print('{}'.format(built[line][column]), end='')
            else:
                print('{}'.format(built[line][column]), end='\n')


def new_world():
    global y, x, world
    world = build(difficult)
    draw(world)


def move():
    global y, x, world, moving
    key = input('Move: ')
    if key == 'w' and world[y - 1][x] == ' ':
        world[y][x] = ' '
        y -= 1
    elif key == 'd' and world[y][x + 1] == ' ':
        world[y][x] = ' '
        x += 1

    elif key == 's' and world[y + 1][x] == ' ' or world[y + 1][x] == '_':
        world[y][x] = ' '
        y += 1

    elif key == 'a' and world[y][x - 1] == ' ':
        world[y][x] = ' '
        x -= 1

    elif key == 'r':
        moving -= 1
        new_world()

    elif key == '':
        moving -= 1

    moving += 1
    draw(world)


if __name__ == '__main__':
    world = build(difficult)
    draw(world)
    for level in range(1, 11):
        try:
            start = time.time()
            while world[y][x] != world[-1][difficult['width'] // 2]:

                print('Level: {}'.format(level))
                print('\n\tUp: s, Right: d, Down: s, Left: a')
                print('\tMoviment: {}\n'.format(moving))
                move()

            finish = time.time()
            os.system('clear')
            seconds = finish - start
            print('\n\n\n\t\t\tCongratilations... your time was {} seconds'.format(int(seconds)))
            time.sleep(3)
            y, x = 1, 1
            moving = 0
            difficult['height'] += 2
            difficult['width'] += 6
            world = build(difficult)
            draw(world)
        except KeyboardInterrupt:
            print('\rIncompleto...')
            exit(0)

print('You win!!!')
exit(0)
