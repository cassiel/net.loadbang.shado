from __future__ import generators
from tiles.Tile import Tile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Moonbase(Tile):
    '''Emulate one of the Moonbase console displays.'''

    def __init__(self):
        def position(block):
            '''
            position generator: for convenience, it draws in a 6 x 6
            block which we then position into the frame.
            '''
            while True:
                for x in range(6):
                    for y in range(5):          # snake
                        block.fill(LampState.OFF)
                        if x % 2 == 0:          # snake up
                            block.setLamp(x, 4 - y, LampState.ON)
                            yield None
                        else:                   # snake down
                            block.setLamp(x, y, LampState.ON)
                            yield None

                for x in range(6):
                    block.fill(LampState.OFF).setLamp(5 - x, 5, LampState.ON)
                    yield None

        Tile.__init__(self, 3)
        b = Block(6, 6)
        self.__gen = position(b)
        self.getFrame().add(b, 1, 1)

    def count(self, n):
        self.__gen.next()
