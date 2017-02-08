(ns user
  (:require [mount.core :as mount]
            clojure-webapp.core))

(defn start []
  (mount/start-without #'clojure-webapp.core/http-server
                       #'clojure-webapp.core/repl-server))

(defn stop []
  (mount/stop-except #'clojure-webapp.core/http-server
                     #'clojure-webapp.core/repl-server))

(defn restart []
  (stop)
  (start))


