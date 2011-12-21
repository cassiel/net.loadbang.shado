from tiles.Tile import Tile
from java.util import Random
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class PixelFlip(Tile):
    '''A random pattern with single pixel flips.'''

    def __init__(self):
        Tile.__init__(self, 1, 1)
        self.__random = Random()
        b = Block(8, 8)

        for i in range(0, 8):
            for j in range(0, 8):
                if self.__random.nextBoolean():
                    b.setLamp(i, j, LampState.ON)
                else:
                    b.setLamp(i, j, LampState.OFF)

        self.getFrame().add(b, 0, 0)
        self.__block = b

    def count(self, n):
        i = self.__random.nextInt(8)
        j = self.__random.nextInt(8)
        b = self.__block

        if b.getLamp(i, j) == LampState.ON:
            b.setLamp(i, j, LampState.OFF)
        else:
            b.setLamp(i, j, LampState.ON)
