from tiles.DisposableTile import DisposableTile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Cursor(DisposableTile):
    ''''Teletype cursor.'''

    def __init__(self):
        DisposableTile.__init__(self, 3)

        f = self.getFrame()
        b = Block('1')
        f.add(b, 7, 7)
        self.__block = b

    def count(self, n):
        f = self.getFrame()
        b = self.__block

        if n == 0:
            f.hide(b)
        elif n == 3:
            f.show(b)
