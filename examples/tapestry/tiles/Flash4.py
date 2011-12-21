from __future__ import generators
from tiles.Tile import Tile
from net.loadbang.shado import Block, ViewPort
from net.loadbang.shado.types import LampState

class Flash4(Tile):
    '''
    Simple square flashing - initially four, but now modded
    to take a size argument.
    '''

    def __init__(self, size):
        Tile.__init__(self)
        frame = self.getFrame()

        # Underlying pattern:
        b = Block(size, size).fill(LampState.ON)

        i = 0
        n = 0
        while i < 8:
            j = 0
            while j < 8:
                if n % 2 == 0: frame.add(ViewPort(b, 0, 0, size, size), i, j)
                n += 1
                j += size

            i += size
            n += 1

        # Top layer which we flip:
        b = Block(8, 8).fill(LampState.FLIP)
        frame.add(b, 0, 0)

        def tick():
            while True:
                frame.hide(b)
                yield None
                frame.show(b)
                yield None
    
        self.__ticker = tick()

    def sync(self, bar, beat):
        self.__ticker.next()
