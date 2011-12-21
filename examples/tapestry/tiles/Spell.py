from tiles.Tile import Tile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Spell(Tile):
    '''Spell the word MONOME.'''

    def __init__(self):
        Tile.__init__(self)
        letters = [
            '00000011 00000000 00000000 00000000 00000000 00000000 00000000 00000000', # ---
            '00000000 00000011 00000000 00000000 00000000 00000000 00000000 00000000', # ---
            '10001000 11011000 10101011 10101000 10001000 10001000 10001000 00000000', # M
            '01110000 10001000 10001000 10001011 10001000 10001000 01110000 00000000', # O
            '10001000 11001000 10101000 10011000 10001011 10001000 10001000 00000000', # N
            '01110000 10001000 10001000 10001000 10001000 10001011 01110000 00000000', # O
            '10001000 11011000 10101000 10101000 10001000 10001000 10001011 00000000', # M
            '11111000 10000000 10000000 11110000 10000000 10000000 11111000 00000011'  # E
        ]

        f = self.getFrame()
        self.__blocks = [Block(letters[i]) for i in range(8)]
        for b in self.__blocks: f.add(b, 0, 0)

    def sync(self, bar, beat):
        self.getFrame().top(self.__blocks[beat])
