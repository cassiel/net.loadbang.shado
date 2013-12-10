# `net.loadbang.shado` [![Build Status](https://secure.travis-ci.org/cassiel/net.loadbang.shado.png)](http://travis-ci.org/cassiel/net.loadbang.shado)

`shado` is a compositing and sprite library for the monome. It is
written in Java, but designed to be dynamically scripted in a language
like Python and hosted in [MaxMSP][max] (or Max for Live). The common
usage scenario is to install `shado` alongside our [Java Python
interpreter][jython] in a MaxMSP system, and drive it via Python scripts
triggered and controlled by MaxMSP messages.

To get a sense for what's achievable in shado, take a look at this
[video][vimeo].

The file [README.MANUAL][manual] will eventually be the manual for
shado; for now, it contains an explanation of the shado architecture -
quite possibly, along with the examples, just about enough to start
writing `shado` "programs".

## Documentation

The JavaDocs can be generated from Maven by

	mvn javadoc:javadoc

The documentation is written to `target/site/apidocs`.

## License

Distributed under the [GNU General Public License][gpl].

Copyright (C) 2011 Nick Rothwell.

[vimeo]: http://vimeo.com/1338613
[max]: http://cycling74.com/products/max/
[jython]: https://github.com/cassiel/net.loadbang.jython
[lib]: https://github.com/cassiel/net.loadbang.lib
[manual]: https://github.com/cassiel/net.loadbang.shado/blob/master/README.MANUAL.md
[osc]: https://github.com/cassiel/net.loadbang.osc
[gpl]: http://www.gnu.org/copyleft/gpl.html
