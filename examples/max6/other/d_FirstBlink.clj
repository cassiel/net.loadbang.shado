(ns user
  (:import (net.loadbang.shado Block))
  (:import (net.loadbang.shado.types LampState))
  (:require [config :as c]))

(let [lightBlock (Block. 8 8)]
  (.fill lightBlock LampState/ON)
  (.render c/renderer lightBlock))
