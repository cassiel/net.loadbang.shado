# net.loadbang.shado

shado is a compositing and sprite library for the monome. It is
written in Java, but designed to be dynamically scripted in a language
like Python and hosted in [MaxMSP][max] (or Max for Live). The common
usage scenario is to install shado alongside our [Java Python
interpreter][jython] in a MaxMSP system, and drive it via Python scripts
triggered and controlled by MaxMSP messages.

The file README.MANUAL will eventually be the manual for shado; for
now, it contains an explanation of the shado architecture - quite
possibly, along with the examples, just about enough to start writing
shado "programs".

The prebuilt JAR files are in the sub-directory `distribution`, or the
library can be built from the enclosed sources using Maven. (For the
Maven build, clone and build [net.loadbang.lib][lib] first, since our
libraries are not yet in a central repository.)

See the README for [net.loadbang.lib][lib] for installation details.

## Documentation

The JavaDocs can be generated from Maven by

	mvn javadoc:javadoc

The documentation is written to `target/site/apidocs`.

## License

Distributed under the [GNU General Public License][gpl].

Copyright (C) 2011 Nick Rothwell.

[max]: http://cycling74.com/products/max/
[jython]: https://github.com/cassiel/net.loadbang.jython
[lib]: https://github.com/cassiel/net.loadbang.lib
[manual]: https://github.com/cassiel/net.loadbang.shado/README.MANUAL.md
[osc]: http://opensoundcontrol.org/
[gpl]: http://www.gnu.org/copyleft/gpl.html
