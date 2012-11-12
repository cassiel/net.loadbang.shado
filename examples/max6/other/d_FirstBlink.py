'''
When launched, this script turns on all LEDs.
'''

from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState
from config import renderer

lightBlock = Block(8, 8)
lightBlock.fill(LampState.ON)
renderer.render(lightBlock)
