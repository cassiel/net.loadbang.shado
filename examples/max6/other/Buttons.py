'''
Simple button pressing: every button is a toggle.
'''

from net.loadbang.shado import Frame, Block, ViewPort, PressManager
from net.loadbang.shado.types import LampState
from config import renderer

class MyBlock(Block):
    def __init__(self):
        Block.__init__(self, 1, 1)
        self.fill(LampState.OFF)

    def press(self, x, y, how):
        if how != 0:
            if self.getLamp(0, 0) == LampState.OFF:
                self.fill(LampState.ON)
            else:
                self.fill(LampState.OFF)

            draw()

        return True

frame = Frame()
manager = PressManager(frame)

# 8 x 16 just for our personal testing:

for x in range(16):
    for y in range(8):
        frame.add(MyBlock(), x, y)

def bang():
    pass

def press(x, y, how):
    manager.press(x, y, how)

def draw():
    renderer.render(frame)

draw()
