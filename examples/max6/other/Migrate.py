'''
Animation. (Needs 10msec metro.) Sweeps an
inner XOR block over a button-toggled
background pattern. Contains generator magic.
'''

from __future__ import generators
from net.loadbang.shado import Frame, Block
from net.loadbang.shado.types import LampState
from config import renderer

outer = Block(4, 4).fill(LampState.ON)
inner = Block(2, 2).fill(LampState.FLIP)

def posGenerator():
    while True:
        for i in range(8): yield i

pos = posGenerator()
n = pos.next()
frame = Frame().add(outer, 2, 2).add(inner, n, n)

frame.hide(outer)

count = 0

def bang():
    global count
    count += 1
    if count % 10 == 0: doit()

def press(x, y, n):
    if n == 1:
        frame.show(outer)
    else:
        frame.hide(outer)

    draw()

def doit():
    n = pos.next()
    frame.moveTo(inner, n, n)
    draw()

def draw():
    renderer.render(frame)

draw()
