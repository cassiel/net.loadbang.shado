'''
Simple animation. Turn on the 10msec
metronome to see things move.
'''

from net.loadbang.shado import Frame, Block, ViewPort
from net.loadbang.shado.types import LampState
from config import renderer

block = Block(4, 4).fill(LampState.THRU)

# We can no longer add a block to a frame more than once (we don't use stamps
# any more) so we have to add a sub-frame to each instance.

frame = Frame()

position = 0

frame.add(Frame().add(block, 0, 0), 0, 0)
frame.add(Frame().add(block, 0, 0), 4, 0)
frame.add(Frame().add(block, 0, 0), 0, 4)
frame.add(Frame().add(block, 0, 0), 4, 4)
frame.add(Frame().add(block, 0, 0), 2, 2)

count = 0

def bang():
    global count
    count += 1
    if count % 10 == 0: doit()

def press(x, y, n): pass

def doit():
    global position
    position = (position + 1) % 16
    x = position % 4
    y = position / 4
    block.fill(LampState.THRU).setLamp(x, y, LampState.ON)
    draw()

def draw():
    renderer.render(frame)

draw()
