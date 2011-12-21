# A module for running tiles.

from Tapestry import Tapestry, Tapestry2
from shared.ConfiguredRenderer import ConfiguredRenderer

r = ConfiguredRenderer()
t = Tapestry2("T2")

def sync(bar, beat):
    r.render(t.sync(bar, beat))

def clock(hundredths):
    r.render(t.clock(hundredths))

def prime():
    t.prime()

def prepare(bar, dx1, dy1, dx2, dy2):
    t.prepare(bar, dx1, dy1, dx2, dy2)

def nudge():
    vp00 = t.nudge()
    if not vp00 is None: r.render(vp00)

def done():
    t.done()
