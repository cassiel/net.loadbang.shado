from shared import config
from net.loadbang.shado import OSCOutputter
import net.loadbang.shado.Renderer

class ConfiguredRenderer:
    def __init__(self):
        self.__renderer = \
            net.loadbang.shado.Renderer(
                config.monomeWidth,
                config.monomeHeight,
                OSCOutputter(
                    config.monomeHost,
                    config.monomePort,
                    config.monomeWidth,
                    config.monomePrefix
                   )
                )

    def render(self, frame):
        self.__renderer.render(frame)
