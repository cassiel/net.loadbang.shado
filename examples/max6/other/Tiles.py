'''
Tile replication demo. 2 x 2 tiles which can be clicked to
affect the entire grid.
'''

from net.loadbang.shado import Frame, Block, ViewPort, PressManager
from net.loadbang.shado.types import LampState
from config import renderer

class MyBlock(Block):
    def __init__(self):
        Block.__init__(self, 2, 2)
        self.fill(LampState.OFF)

    def press(self, x, y, how):
        '''
        Override the built-in press function. Every tile instance
        accepts a press, and the resulting change is tesselated
        across the entire grid.
        '''
        if how != 0:
            state = self.getLamp(x, y)
            if state == LampState.OFF:
                self.setLamp(x, y, LampState.ON)
            else:
                self.setLamp(x, y, LampState.OFF)

            draw()

        return True

block = MyBlock()
frame = Frame()
manager = PressManager(frame)

# We can no longer add a block to a frame more than once (we don't use stamps
# any more) so we have to add a ViewPort to each instance.

for x in range(0, 8, 2):
    for y in range(0, 8, 2):
        frame.add(ViewPort(block, 0, 0, 2, 2), x, y)

def bang():
    pass

def press(x, y, how):
    manager.press(x, y, how)

def draw():
    renderer.render(frame)

draw()
