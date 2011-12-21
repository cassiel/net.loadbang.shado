from __future__ import generators
from tiles.Tile import Tile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Border(Tile):
    '''Animate a border.'''
    
    def __init__(self):
        Tile.__init__(self, 3)

        def position(border):
            while True:
                for i in range(1 + border, 8 - border): yield (i, border)
                for i in range(1 + border, 8 - border): yield (7 - border, i)
                for i in range(1 + border, 8 - border): yield (7 - i, 7 - border)
                for i in range(1 + border, 8 - border): yield (border, 7 - i)

        self.__gens = []

        for i in range(4):
            self.__gens.append(position(i))

        self.__bloc = Block(8, 8)
        self.getFrame().add(self.__bloc, 0, 0)

    def count(self, n):
        self.__bloc.fill(LampState.OFF)

        for g in self.__gens:
            (x, y) = g.next()
            self.__bloc.setLamp(x, y, LampState.ON)
