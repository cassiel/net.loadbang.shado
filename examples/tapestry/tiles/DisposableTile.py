# A tile which is marked as not going into the recycling list.

from tiles.Tile import Tile

class DisposableTile(Tile):
    def __init__(self, interval=10, limit=10):
        Tile.__init__(self, interval, limit)
        
    def disposable(self): return True
