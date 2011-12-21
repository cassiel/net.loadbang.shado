from net.loadbang.shado import OSCOutputter, Frame, ViewPort
from java.util import Random

from tiles.Cursor import Cursor
from tiles.Bang import Bang
from tiles.Moonbase import Moonbase
from tiles.Bars import Bars
from tiles.Eclipse import Eclipse
from tiles.Spell import Spell
from tiles.Hanoi import Hanoi
from tiles.Border import Border
from tiles.Flash4 import Flash4
from tiles.Cross import Cross
from tiles.Counter import Counter
from tiles.FourWay import FourWay
from tiles.PixelFlip import PixelFlip
from tiles.Shards import Shards

class TileState:
    'A renderable and a (Python-class) tile.'
    def __init__(self, tile):
        self.renderable = tile.getMasterFrame()
        self.tile = tile

class Tapestry:
    '''
    A container which gives the appearance of a pannable array of
    tiles. In practice, it only needs to have two at any one time,
    arranged so that we can animate a pan from one to the other.
    We do keep a list of other possible tiles.
    '''

    def __init__(self, name):
        self.__name = name

        # General tools:
        self.__random = Random()

        # Full frame, which can hold two tiles next to each other (X or Y):
        ffr = Frame()

        # Window frame, original matching the monome, within which we move
        # the full frame

        wfr = Frame()

        # Cropped renderable, which is the one we actually render (so that we
        # don't overwrite any adjacent pixels in a bigger design).

        port = ViewPort(wfr, 0, 0, 8, 8)

        # Create a pool of tiles - we can populate __tilePool to hard-wire the
        # first tile if we want to test it explicitly.
        # Cursor() is a special-case, manually loaded for the first few bars.

        self.__fixedTiles = {
            'CURSOR' : Cursor(),
            'BANG' : Bang()
        }

        self.__tilePool = []

        self.__usedPool = [
            Moonbase(),
            Hanoi(False),
            Hanoi(True),
            Eclipse(),
            Spell(),
            Shards(1),
            Shards(3),
            Bars(),
            Border(),
            Flash4(4),
            Flash4(2),
            Cross(),
            Counter(),
            PixelFlip(),
            FourWay()
        ]

        # Set up the first tile:
        t = self.__chooseTile()

        # Set up out state: the stamp for our starting tile.
        ffr.add(t.getMasterFrame(), 0, 0)
        self.__this = TileState(t)
        self.__next00 = None

        # Locate the full frame at (0, 0) within the Monome.
        wfr.add(ffr, 0, 0)

        # We'll need these later:
        self.__fullFrame = ffr
        self.__windFrame = wfr
        self.__viewPort = port

        # Not used (yet), but let's be clean:
        self.__vector = (0, 0)

        self.__nudging = False

    def __chooseTile(self):
        '''
        select a tile (and immediately put it into the used pool);
        if all gone, refresh all from the used pool.
        '''
        if len(self.__tilePool) == 0:
            print self.__name + ": starting new tile pool"
            self.__tilePool = self.__usedPool
            self.__usedPool = []

        idx = self.__random.nextInt(len(self.__tilePool))
        t = self.__tilePool.pop(idx)

        if not t.disposable():
            self.__usedPool.append(t)

        print self.__name + ": tile: " + repr(t.__doc__)

        return t

    def prepare(self, bar, dx, dy, __1=0, __2=0):
        '''
        Prepare to shift from the current tile to the next one.
        Plug the new tile into the full frame at the destination point.
        (This frame will have the current tile at (0, 0).)
        '''
        ffr = self.__fullFrame

        # Invent a direction:
        v = (dx, dy)

        # Pick a random tile from our pool, or hard-wire the ones we need:

        if bar < 5:
            print 'Selecting CURSOR.'
            t = self.__fixedTiles['CURSOR']
        elif bar >= 29:
            print 'Selecting BANG.'
            t = self.__fixedTiles['BANG']
        else:
            t = self.__chooseTile()

        if t is self.__this.tile:
            self.__nudging = False
        else:
            self.__nudging = True
            # Set up our state, ready for the nudge/pan:
            ffr.add(t.getMasterFrame(), v[0] * 8, v[1] * 8)
            self.__next00 = TileState(t)
            self.__vector = v
            t.prepare()

    def nudge(self):
        if self.__nudging:
            'Offset from the current tile to the new one by one pixel.'
            (dx, dy) = self.__vector
            self.__windFrame.moveBy(self.__fullFrame, -dx, -dy)
            return self.__viewPort
        else:
            return None

    def done(self):
        'Finished nudging: tidy up.'
        if self.__nudging and not self.__next00 is None:
            ffr = self.__fullFrame
            wfr = self.__windFrame

            # Remove old tile from fullFrame:
            ffr.remove(self.__this.renderable)

            # Move new tile to (0, 0) within fullFrame:
            ffr.moveTo(self.__next00.renderable, 0, 0)

            #  Move fullFrame to (0, 0) within windFrame:
            wfr.moveTo(self.__fullFrame, 0, 0)

            # Establish new current tile:
            self.__this = self.__next00
            self.__next00 = None

    def sync(self, bar, beat):
        'Synchronise to a bar/beat position'
        self.__this.tile.sync(bar, beat - 1)

        n00 = self.__next00
        if not n00 is None: n00.tile.sync(bar, beat - 1)

        return self.__viewPort

    def clock(self, hundredths):
        'Synchronise to a stopwatch time'
        self.__this.tile.clock(hundredths)

        n00 = self.__next00
        if not n00 is None: n00.tile.clock(hundredths)

        return self.__viewPort

class Tapestry2:
    '''
    A "dual" tapestry for my new monome 128! Runs two
    tapestry objects side by side, dynamically rendering
    them into a composite frame. It's a bit of a hack:
    there's common code in Tapestry which we could factor
    out - but it's *supposed* to be a hack.
    '''
    def __init__(self, name):
        self.__t1 = Tapestry(name + " [A]")
        self.__t2 = Tapestry(name + " [B]")

    def __compose(self, f1, f2):
        '''
        This isn't totally right as a case analysis - the nudging
        property is subtle - but it'll do as a demo.
        '''
        if f1 is None and f2 is None:
            return None
        else:
            frame = Frame()
            if not f1 is None: frame.add(f1, 0, 0)
            if not f2 is None: frame.add(f2, 8, 0)
            return frame

    def sync(self, bar, beat):
        return self.__compose(self.__t1.sync(bar, beat),
                              self.__t2.sync(bar, beat)
                             )

    def clock(self, hundredths):
        return self.__compose(self.__t1.clock(hundredths),
                              self.__t2.clock(hundredths)
                             )

    def prime(self):
        self.__t1.prime();
        self.__t2.prime();

    def prepare(self, bar, dx1, dy1, dx2, dy2):
        self.__t1.prepare(bar, dx1, dy1)
        self.__t2.prepare(bar, dx2, dy2)

    def nudge(self):
        return self.__compose(self.__t1.nudge(),
                              self.__t2.nudge()
                             )

    def done(self):
        self.__t1.done()
        self.__t2.done()
