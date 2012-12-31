'''
Draw a cross for the last pressed button.
'''

from config import renderer
from net.loadbang.shado import Frame, Block
from net.loadbang.shado.types import LampState

vertical = Block(1, 16).fill(LampState.ON)
horizontal = Block(16, 1).fill(LampState.ON)

frame = Frame().add(vertical, 0, 0).add(horizontal, 0, 0)

def hide():
    frame.hide(vertical)
    frame.hide(horizontal)
    renderer.render(frame)

hide()

def bang(): pass

def press(x, y, n):
    if n == 1:
        frame.moveTo(vertical, x, 0).show(vertical)
        frame.moveTo(horizontal, 0, y).show(horizontal)
        renderer.render(frame)
    else:
        hide()
