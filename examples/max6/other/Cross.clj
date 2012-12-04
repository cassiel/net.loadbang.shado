(ns user
  (:import (net.loadbang.shado Frame Block))
  (:import (net.loadbang.shado.types LampState))
  (:require [config :as c]))

(defn cross [x y]
  (let [vertical (-> (Block. 1 16) (.fill LampState/ON))
        horizontal (-> (Block. 16 1) (.fill LampState/ON))]
    (-> (Frame.)
        (.add vertical x 0)
        (.add horizontal 0 y))))

(defn press [x y n]
  (.render c/renderer
           (if (pos? n) (cross x y) (Frame.))))
