from tiles.Tile import Tile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Counter(Tile):
    '''Simple stopwatch/counter.'''

    def __init__(self):
        Tile.__init__(self, 10, 100)
        digits = ['111 101 101 101 111',
                  '110 010 010 010 010',
                  '111 001 111 100 111',
                  '111 001 111 001 111',
                  '101 101 111 001 001',
                  '111 100 111 001 111',
                  '111 100 111 101 111',
                  '111 001 001 001 001',
                  '111 101 111 101 111',
                  '111 101 111 001 111'
                 ]

        lftBlocks = [Block(digits[i]) for i in range(10)]
        rhtBlocks = [Block(digits[i]) for i in range(10)]

        f = self.getFrame()

        for i in range(10):
            f.add(lftBlocks[i], 0, 0).add(rhtBlocks[i], 5, 0)

        self.__lftBlocks = lftBlocks
        self.__rhtBlocks = rhtBlocks

    def count(self, n):
        f = self.getFrame()
        f.top(self.__lftBlocks[n / 10])
        f.top(self.__rhtBlocks[n % 10])
