# clojure-webapp

generated using Luminus version "2.9.11.30"

FIXME

## Prerequisites

You will need [Leiningen][1] 2.0 or above installed.

[1]: https://github.com/technomancy/leiningen

## Running

To start a web server for the application, run:

    lein run

## Testing with database

    (use 'clojure-webapp.db.core)
    (mount/start #'clojure-webapp.config/env)
    (mount.core/start #'clojure-webapp.db.core/*db*)

## License

Copyright © 2017 FIXME
