from tiles.DisposableTile import DisposableTile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState
from java.util import Random

class Bang(DisposableTile):
    '''
    Tile which goes bang on beat 8 of the bar, and doesn't reset.
    Until then, it has a convincing behaviour as a crosshair.
    '''

    def __init__(self):
        DisposableTile.__init__(self, 10)
        self.__random = Random()

        widget = Block('010 111 010')
        self.getFrame().add(widget, 0, 0)
        self.__widget = widget

        # Add the 'blow-up' on top - but hide it.
        bang = Block(8, 8).fill(LampState.ON)
        self.getFrame().add(bang, 0, 0).hide(bang)
        self.__bang = bang

    def count(self, n):
        x = self.__random.nextInt(6)
        y = self.__random.nextInt(6)
        self.getFrame().moveTo(self.__widget, x, y)

    def sync(self, bar, beat):
        if beat == 7:
            self.getFrame().show(self.__bang)
