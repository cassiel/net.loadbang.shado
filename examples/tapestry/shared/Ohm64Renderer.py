'''
A renderer which generates messages for the Ohm64 in its default setup. This
is thinly-disguised MIDI: Max does the formatting.
'''
from net.loadbang.shado import IOutputter, Renderer

OHM_ROWS = 8
OHM_COLS = 8

class Ohm64Outputter(IOutputter):
    def __init__(self, maxObject):
        self.__maxObject = maxObject
        self.__lastRows = [-1 for _ in range(OHM_ROWS)]
        # That won't work as an UNASSIGNED for 32-column devices (!).

    def outputRow(self, row, colBits):
        lastRow = self.__lastRows[row]

        for col in range(OHM_COLS):
            lastBit = (lastRow >> col) & 1
            thisBit = (colBits >> col) & 1

            if lastBit != thisBit:
                # Ohm64 indexes buttons vertically:
                self.__maxObject.outlet(0, [row + col * 8, thisBit])

        self.__lastRows[row] = colBits

class Ohm64Renderer(Renderer):
    def __init__(self, maxObject):
        Renderer.__init__(self, OHM_COLS, OHM_ROWS, Ohm64Outputter(maxObject))
