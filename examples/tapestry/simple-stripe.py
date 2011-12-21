'''
A module for running tiles. This drives an Ohm64 and sends MIDI-formattable
messages - we're probably in Max for Live here, so the Max Device will output
it.
'''

from Tapestry import Tapestry
from shared.Ohm64Renderer import Ohm64Renderer

r = Ohm64Renderer(maxObject)
t = Tapestry("T1")

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
