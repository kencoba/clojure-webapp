(ns clojure-webapp.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[clojure-webapp started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[clojure-webapp has shut down successfully]=-"))
   :middleware identity})
