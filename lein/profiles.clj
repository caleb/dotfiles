{:user
 {:plugins      [[venantius/ultra "0.4.1"]
                 [refactor-nrepl "2.2.0"]
                 [cider/cider-nrepl "0.11.0"]]
  :dependencies [[spyscope "0.1.4"]
                 [org.clojure/tools.namespace "0.2.11"]
                 [io.aviso/pretty "0.1.26"]
                 [im.chit/vinyasa "0.4.7"]]
  :injections
  [(require 'spyscope.core)
   (require '[vinyasa.inject :as inject])
   (require 'io.aviso.repl)
   (inject/in ;; the default injected namespace is `.`

    ;; note that `:refer, :all and :exclude can be used
    [vinyasa.inject :refer [inject [in inject-in]]]

    ;; imports all functions in vinyasa.pull
    [vinyasa.maven pull]

    [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

    [clojure.tools.namespace.repl]

    [clojure.pprint pprint]
    [clojure.java.shell sh])]}}
