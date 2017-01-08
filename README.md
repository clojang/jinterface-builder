# jinterface-builder

[![Clojars Project][clojars-badge]][clojars]

*The means by which Clojang projects generate new JInterface releases to Clojars*

[![Clojang logo][logo]][logo-large]


#### Contents

* [Introduction](#introduction-)
* [Dependencies](#dependencies-)
* [A Note on Versions](#a-note-on-versions-)
* [Building](#building-)
* [License](#license-)


## Introduction [&#x219F;](#contents)

The various [Clojang projects](https://github.com/clojang) use various versions
of Erlang's JInterface Java library, depending upon the version of Erlang (see
[the table below](#a-note-on-versions-) to check which versions of Erlang pair up with which versions of
JInterface).

In fact, getting Erlang, JInterface, and Clojure working together can be tricky just for the simple fact that the JInterface ``.jar`` files available in various locations online can be mismatched with the intended version of Erlang (or not built properly).

Due to the problems we have encountered in running Clojure/BEAM applications with the available JInterface ``.jar`` files on Clojars, we needed a reliable solution. After the good results, we wanted to help out by publishing what, so far, seem to be working JInterface ``.jar`` files on Clojars. They are available here:

* [org.erlang.otp/jinterface](https://clojars.org/org.erlang.otp/jinterface)

(Note that we don't yet have automated builds and testing set up for those; [feedback/assistance is welcome](https://github.com/clojang/jinterface-builder/issues/new)).

To make this easier for devs to do themselves, the JInterface "builder" (a handful of ``make`` targets) has been released as its own project: this one.


## A Note on Versions [&#x219F;](#contents)

JInterface is only guaranteed to work with the version of Erlang with which it
was released. The following table correlates version numbers:

| Erlang Release | Erlang Version (erts) | JInterface |
|----------------|-----------------------|------------|
| 19.2           | 8.2                   | 1.7.1      |
| 19.1           | 8.1                   | 1.7.1      |
| 19.0           | 8.0                   | 1.7        |
| 18.3           | 7.3                   | 1.6.1      |
| 18.2           | 7.2                   | 1.6.1      |
| 18.1           | 7.1                   | 1.6        |
| 18.0           | 7.0                   | 1.6        |
| 17.5           | 6.4                   | 1.5.12     |
| 17.4           | 6.3                   | 1.5.11     |
| 17.3           | 6.2                   | 1.5.10     |
| 17.2           | 6.1                   | 1.5.9      |
| 17.1           | 6.1                   | 1.5.9      |
| 17.0           | 6.0                   | 1.5.9      |
| R16B03         | 5.10.4                | 1.5.8      |
| R16B02         | 5.10.3                | 1.5.8      |
| R16B01         | 5.10.2                | 1.5.8      |
| R16B           | 5.10.1                | 1.5.8      |
| R15B03         | 5.9.3                 | 1.5.6      |
| R15B02         | 5.9.2                 | 1.5.6      |
| R15B01         | 5.9.1                 | 1.5.6      |
| R15B           | 5.9                   | 1.5.5      |

A convenience target is provided to display the versions that will be used to build JInterface:

```bash
$ make show-versions
```

Here is the list of versions we've published on Clojars to date (also [availble here](https://clojars.org/org.erlang.otp/jinterface/versions)):

* 1.6.1
* 1.6
* 1.5.12
* 1.5.8
* 1.5.6
* 1.5.3

If you would like to use a version not yet uploaded to Clojars, let us know (i.e., [open a ticket](https://github.com/clojang/jinterface-builder/issues/new)), and we'll see what we can do to get you sorted.


## Dependencies [&#x219F;](#contents)

* Java
* Maven
* ``lein``
* Erlang
* GNU ``make``


## Building [&#x219F;](#contents)

To ensure that your version of JInterface is ready for use by Clojure with your
version of Erlang, simply do this:


```bash
$ make
```

(Which points to the the ``jinterface-local`` target.)

This will discover the Erlang root directory for the first ``erl`` found in your
``PATH``. This will be used to find the JInterface Java source files for that version
of Erlang.

If you wish to override this, you may do the following:

```bash
$ make ERL_LIBS=/opt/erlang/15.3.1
```

This ``make`` target (which depends upon Maven being installed) will
generate a ``lein``-friendly ``.jar`` file for you in your
``~/.m2/repository`` directory, just like ``lein`` does with downloaded Clojars.


## License [&#x219F;](#contents)

```
Copyright © 2016 Duncan McGreggor

Distributed under the Apache License Version 2.0.
```


<!-- Named page links below: /-->

[travis]: https://travis-ci.org/clojang/jinterface-builder
[travis-badge]: https://travis-ci.org/clojang/jinterface-builder.png?branch=master
[logo]: https://github.com/clojang/resources/blob/master/images/logo-5-250x.png
[logo-large]: https://github.com/clojang/resources/blob/master/images/logo-5-1000x.png
[clojars]: https://clojars.org/org.erlang.otp/jinterface
[clojars-badge]: https://img.shields.io/clojars/v/org.erlang.otp/jinterface.svg
