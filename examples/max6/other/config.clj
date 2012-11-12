;;'''Configuration for a renderer shared between the examples.'''

(ns config
  (:import (net.loadbang.shado SerialOSCBinaryOutputter BinaryRenderer)))

(def renderer
  (let [monomeHost "localhost"
        monomePort 16543
        monomePrefix "/test"
        monomeWidth 8
        monomeHeight 8]
    (BinaryRenderer. monomeWidth
                     monomeHeight
                     (SerialOSCBinaryOutputter. monomeHost
                                                monomePort
                                                monomeWidth
                                                monomePrefix))))
