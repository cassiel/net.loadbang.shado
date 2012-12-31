'''Configuration for a renderer shared between the examples.'''

from net.loadbang.shado import SerialOSCBinaryOutputter, BinaryRenderer

monomeHost      = 'localhost'
monomePort      = 16543
monomePrefix    = '/test'
monomeWidth     = 8
monomeHeight    = 8

renderer = BinaryRenderer(
    monomeWidth,
    monomeHeight,
    SerialOSCBinaryOutputter(
        monomeHost,
        monomePort,
        monomeWidth,
        monomePrefix
    )
)
