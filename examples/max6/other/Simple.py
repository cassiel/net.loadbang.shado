'''
A simple toggle of a 4 x 4 block of LEDs. Push any
button to show the block.
'''

from net.loadbang.shado import Frame, Block
from net.loadbang.shado.types import LampState
from config import renderer

block = Block(4, 4).fill(LampState.ON)

frame = Frame()
frame.add(block, 2, 2)
blank = Frame()

def bang():
    '''ignore metronome input.'''
    pass

def press(x, y, n):
    if n == 1:
        test()
    else:
        clear()

def test():
    renderer.render(frame)

def clear():
    renderer.render(blank)

clear()
