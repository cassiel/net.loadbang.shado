# Two discs in an eclipse animation.

from __future__ import generators
from tiles.FlipTile import FlipTile
from net.loadbang.shado import Block

class Eclipse(FlipTile):
    '''Eclipse pattern: one disc passes over another.'''

    def __init__(self):
        FlipTile.__init__(self, 1)

        sun = Block('011110 111111 111111 111111 111111 011110')
        moon = Block('.00. 0000 0000 .00.')

        self.getFrame().add(sun, 0, 0).add(moon, 0, 0)

        def bouncer(size):
            while True:
                for i in range(8 + 1 - size): yield i
                # for i in range(8 - size): yield 8 - size - i

        self.__sunGen = bouncer(6)
        self.__moonGen = bouncer(4)

        self.__sun = sun
        self.__moon = moon

    def clock(self, hundredths):
        if hundredths % 20 == 0:
            i = self.__sunGen.next()
            self.getFrame().moveTo(self.__sun, i, i)

        if hundredths % 19 == 0:
            i = self.__moonGen.next()
            self.getFrame().moveTo(self.__moon, i, i)
