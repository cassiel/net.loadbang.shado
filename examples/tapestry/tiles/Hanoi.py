# Nested XOR-able squares.

from java.util import Random
from tiles.FlipTile import FlipTile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Hanoi(FlipTile):
    '''
    Nested squares, which can either sync to the beat or run
    at high speed.
    '''

    def __init__(self, inSync):
        FlipTile.__init__(self, 5)

        self.__blocks = []
        self.__states = []
        self.__random = Random()

        for border in range(4):
            size = 8 - border * 2
            b = Block(size, size).fill(LampState.FLIP)
            self.getFrame().add(b, border, border)
            self.__blocks.append(b)
            self.__states.append(False)

        self.__inSync = inSync

    def kick(self):
        idx = self.__random.nextInt(4)
        block = self.__blocks[idx]
        state = self.__states[idx]
        frame = self.getFrame()

        if state:
            frame.show(block)
        else:
            frame.hide(block)
               
        self.__states[idx] = not state

    def sync(self, bar, beat):
	if self.__inSync:
            self.kick()

    def count(self, n):
        if not self.__inSync:
            self.kick()
