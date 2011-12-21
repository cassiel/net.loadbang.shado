'''Configuration for a renderer shared between the examples.'''

from net.loadbang.shado import SerialOSCBinaryOutputter, BinaryRenderer

monomeHost      = 'localhost'
monomePort      = 11016
monomePrefix    = '/shado'
monomeWidth     = 16
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
