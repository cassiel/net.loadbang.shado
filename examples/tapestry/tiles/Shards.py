from __future__ import generators
from tiles.FlipTile import FlipTile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class OneShard:
    '''Represents a single shard row, with wrap-round.'''

    def __init__(self, frame, width, row, interval):
        self.__width = width
        self.__interval = interval
        self.__row = row
        self.__frame = frame
        self.__interval = interval
        self.__count = 0

        def position():
            while True:
                for i in range(8 - width): yield i
                for i in range(8 - width): yield 8 - width - i

        self.__gen = position()
            
        b = Block(width, 1).fill(LampState.ON)
        frame.add(b, self.__gen.next(), row)
        self.__block = b

    def kick(self):
        self.__count = (self.__count + 1) % self.__interval

        if self.__count == 0:
            self.__frame.moveTo(self.__block, self.__gen.next(), self.__row)

class Shards(FlipTile):
    '''Animated shards which bounce from left to right; width is parameterised.'''

    def __init__(self, width):
        FlipTile.__init__(self, 1)
        self.__shards = [
            OneShard(self.getFrame(), width, 0, 5),
            OneShard(self.getFrame(), width, 1, 6),
            OneShard(self.getFrame(), width, 2, 7),
            OneShard(self.getFrame(), width, 3, 8),
            OneShard(self.getFrame(), width, 4, 9),
            OneShard(self.getFrame(), width, 5, 10),
            OneShard(self.getFrame(), width, 6, 11),
            OneShard(self.getFrame(), width, 7, 12)
        ]

    def clock(self, hundredths):
        s = self.__shards
        for i in range(len(s)): s[i].kick()
