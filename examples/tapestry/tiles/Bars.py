from __future__ import generators
from tiles.FlipTile import FlipTile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Bars(FlipTile):
    '''Two bars, X and Y, bouncing and XORing.'''
    def __init__(self):
        FlipTile.__init__(self, 1)

        def bouncer():
            while True:
                for i in range(6): yield i
                for i in range(6): yield 6 - i

        self.__hor = Block(8, 2).fill(LampState.FLIP)
        self.getFrame().add(self.__hor, 0, 0)

        self.__ver = Block(2, 8).fill(LampState.FLIP)
        self.getFrame().add(self.__ver, 0, 0)

        self.__xGen = bouncer()
        self.__yGen = bouncer()

    def clock(self, hundredths):
        if hundredths % 3 == 0:
            self.getFrame().moveTo(self.__hor, 0, self.__yGen.next())

        if hundredths % 7 == 0:
            self.getFrame().moveTo(self.__ver, self.__xGen.next(), 0)
