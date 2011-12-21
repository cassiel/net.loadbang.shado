from tiles.FlipTile import FlipTile
from net.loadbang.shado import Block
from net.loadbang.shado.types import LampState

class Cross(FlipTile):
    '''Flip between two crosses.'''

    def __init__(self):
        FlipTile.__init__(self)

        cross1 = Block(8, 8).fill(LampState.OFF)
        cross2 = Block(8, 8).fill(LampState.OFF)

        for i in range(0, 8):
            cross1.setLamp(i, i, LampState.ON)
            cross1.setLamp(i, 7 - i, LampState.ON)

        for i in range(0, 8):
            cross2.setLamp(3, i, LampState.ON)
            cross2.setLamp(4, i, LampState.ON)
            cross2.setLamp(i, 3, LampState.ON)
            cross2.setLamp(i, 4, LampState.ON)

        self.getFrame().add(cross1, 0, 0).add(cross2, 0, 0)

        self.__cross1 = cross1
        self.__cross2 = cross2

    def sync(self, bar, beat):
        if beat % 2 == 1:
            self.getFrame().top(self.__cross1)
        else:
            self.getFrame().top(self.__cross2)
