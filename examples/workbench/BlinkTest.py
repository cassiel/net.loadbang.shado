'''
A demo of the "extended shado" scheduler. We blink four
exclusive-OR panels at different speeds.
'''

from net.loadbang.shado import Frame, Block, ViewPort
from net.loadbang.shado.types import LampState
from net.loadbang.shadox import DisplayTaskManager, XFrame
from config import renderer

# Task manager at 10Hz.
taskManager = DisplayTaskManager(renderer, 100)

block = Block(4, 4).fill(LampState.FLIP)

frame = XFrame(taskManager)

vp1 = ViewPort(block, 0, 0, 4, 4)
vp2 = ViewPort(block, 0, 0, 4, 4)
vp3 = ViewPort(block, 0, 0, 4, 4)
vp4 = ViewPort(block, 0, 0, 4, 4)

frame.add(vp1, 1, 1).hide(vp1).blink(vp1, 1, 5, None)
frame.add(vp2, 3, 3).hide(vp1).blink(vp2, 7, 8, None)
frame.add(vp3, 1, 3).hide(vp3).blink(vp3, 1, 10, None)
frame.add(vp4, 3, 1).hide(vp4).blink(vp4, 9, 11, None)

taskManager.mainFrame.add(frame, 0, 0)

def _cleanup(): taskManager.clear()
engine.addCleanup(_cleanup)
