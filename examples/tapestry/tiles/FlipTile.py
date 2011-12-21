'''A tile which can appear flipped (XOR) without aesthetic visual problems.'''

from net.loadbang.shado import Frame, Block
from net.loadbang.shado.types import LampState
from tiles.Tile import Tile

class FlipTile(Tile):
    '''
    Abstract widget class for one Tile. We also have the ability
    to completely invert whatever the concrete subclass chooses
    to do.
    '''

    def __init__(self, interval=10, limit=10):
        Tile.__init__(self, interval, limit)
        b = Block(8, 8).fill(LampState.FLIP)

        self.__masterFrame = Frame()
        self.__masterFrame.add(self.getFrame(), 0, 0).add(b, 0, 0).hide(b)
        self.__flipped = False
        self.__flipper = b

    def recyclable(self): return True

    def getMasterFrame(self):
        'Return the master frame for display'
        return self.__masterFrame

    def prepare(self):
        if self.__flipped:
            self.__masterFrame.hide(self.__flipper)
        else:
            self.__masterFrame.show(self.__flipper)

        self.__flipped = not self.__flipped
