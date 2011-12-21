from tiles.Tile import Tile
from net.loadbang.shado import Block, ViewPort
from net.loadbang.shado.types import LampState

class FourWay(Tile):
    '''
    A simple walking pattern in a Block which is duplicated
    within a Frame.
    '''

    def __init__(self):
        Tile.__init__(self, 5)
        block = Block(4, 4)

        f = self.getFrame()
        f.add(ViewPort(block, 0, 0, 4, 4), 0, 0)
        f.add(ViewPort(block, 0, 0, 4, 4), 4, 0)
        f.add(ViewPort(block, 0, 0, 4, 4), 0, 4)
        f.add(ViewPort(block, 0, 0, 4, 4), 4, 4)
        f.add(ViewPort(block, 0, 0, 4, 4), 2, 2)

        self.__block = block
        self.__pos = 0

    def count(self, n):
        self.__pos = (self.__pos + 1) % 16
        x = self.__pos % 4
        y = self.__pos / 4
        if (y % 2 == 1): x = 3 - x
        self.__block.fill(LampState.THRU).setLamp(x, y, LampState.ON)
