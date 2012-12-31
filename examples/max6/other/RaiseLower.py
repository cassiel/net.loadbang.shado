'''
A simple raise/lower demo: two tiles in
a frame.
'''

from net.loadbang.shado import Frame, Block
from net.loadbang.shado.types import LampState
from config import renderer

outer = Block(4, 4).fill(LampState.ON)
inner = Block(2, 2).fill(LampState.OFF)

frame = Frame().add(inner, 3, 3).add(outer, 2, 2)

def bang(): pass

def press(x, y, n):
    "Dumb button press handling: we aren't passing presses to shado."
    if n == 1:
        frame.top(inner)
    else:
        frame.bottom(inner)

    renderer.render(frame)

renderer.render(frame)
