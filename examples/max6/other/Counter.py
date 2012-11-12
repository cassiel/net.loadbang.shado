'''
Decimal counter using glyphs for the digits.
Needs the 10msec metronome.
'''

from net.loadbang.shado import Frame, Block
from net.loadbang.shado.types import LampState
from config import renderer

digits = [
    '111 101 101 101 111',
    '110 010 010 010 010',
    '111 001 111 100 111',
    '111 001 111 001 111',
    '101 101 111 001 001',
    '111 100 111 001 111',
    '111 100 111 101 111',
    '111 001 001 001 001',
    '111 101 111 101 111',
    '111 101 111 001 111'
]

frame = Frame()
renderer.render(frame)

mainframe = Frame()
f = mainframe.add(frame, 0, 0)

lftBlocks = [Block(digits[i]) for i in range(10)]
rhtBlocks = [Block(digits[i]) for i in range(10)]

for i in range(10):
    frame.add(lftBlocks[i], 0, 0).add(rhtBlocks[i], 5, 0)

counter = 99
interval = 0

def bang():
    global interval
    global counter

    interval += 1

    if interval % 10 == 0:
        counter = (counter + 1) % 100

        frame.top(lftBlocks[counter / 10])
        frame.top(rhtBlocks[counter % 10])
        renderer.render(mainframe)

def press(x, y, n): pass
