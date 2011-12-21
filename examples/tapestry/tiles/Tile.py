# The "abstract" class for a demo tile which can respond to bar/beat messages
# and sec/10th clock input. It needs to deliver its frame so that it can be
# patched into a tapestry.

from net.loadbang.shado import Frame
from net.loadbang.shado.types import LampState

class Tile:
    'Abstract widget class for one Tile.'

    def __init__(self, interval=10, limit=10):
        self.__clientFrame = Frame()

        self.__interval = interval
        self.__hLimit = interval * limit
        self.__counter = 0

    def disposable(self): return False

    def getMasterFrame(self):
        'Return the master frame for display'
        return self.getFrame()

    def getFrame(self):
        'Return the client frame for graphics'
        return self.__clientFrame

    def sync(self, bar, beat):
        'Synchronise to a bar/beat position'
        pass

    def count(self, n): pass

    def clock(self, hundredths):
        'Synchronise to a stopwatch time'

        c = self.__counter
        interval = self.__interval

        if c % interval == 0:
            self.count(c / interval)

        c = (c + 1) % self.__hLimit
        self.__counter = c

    def prepare(self): pass
