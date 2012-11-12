'''
A slightly smarter version of Simple, using shado's
button-tracking machinery.
'''

from net.loadbang.shado import Block, PressManager, ViewPort, Frame
from net.loadbang.shado.types import LampState
from config import renderer, monomeWidth, monomeHeight

block = Block(4, 4).fill(LampState.ON)

frame = Frame().add(block, 2, 2).hide(block)

class MyViewPort(ViewPort):
    '''
    In order to catch button presses, we'll put a ViewPort around
    the frame, but build it in Python with a callback.
    '''
    def __init__(self, router, x, y, width, height):
        ViewPort.__init__(self, router, x, y, width, height)

    def press(self, x, y, how):
        '''callback from shado: deal with a button press'''
        if how != 0:
            frame.show(block)
        else:
            frame.hide(block)

        renderer.render(self)
        return True

port = MyViewPort(frame, 0, 0, monomeWidth, monomeHeight)

manager = PressManager(port)

def bang(): pass

def press(x, y, how):
    manager.press(x, y, how)

renderer.render(port)
