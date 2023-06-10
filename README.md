# Media Data

This repository is a large dataset suitable for testing either 
the [vtmedia-schema](https://github.com/cjcodeproj/vtmedia-schema) project,  the 
[medialibrary](https://github.com/cjcodeproj/medialibrary) project, or both.  It can
be used for software testing, schema testing, testing XML tools, or as a reference for authoring
your own data.

![License](https://img.shields.io/github/license/cjcodeproj/mediadata)

Everything here is licensed under a Creative Commons license.

# Examples

Here are two examples that could be done with the test data.  In both cases, everything is done as a non-privileged
user and the repository (or software) can be deleted if it's no longer required.

## XMLSchema Testing

| Repository | Release | Purpose |
| --- | --- | -- |
| [vtmedia-schema](https://github.com/cjcodeproj/vtmedia-schema) | [![Release Download](https://img.shields.io/github/v/release/cjcodeproj/vtmedia-schema?display_name=tag)](https://github.com/cjcodeproj/vtmedia-schema/releases) | XSD/XML Validation Schema |

Download the schema repository using either a release, or the development branch.  The download
should be in a separate directory path.

There is a command line tool in the bin directory to run a validation check; it just needs to
know where the schema is.  The tool requires `xmllint`, which most operating systems already
have installed.

The schema should also be usable by other tools, including xmlstarlet, PowerShell, VS Code,
and most IDE development tools.

```
$ mkdir git
$ cd git
$ git clone https://github.com/cjcodeproj/mediadata.git
$ git clone https://github.com/cjcodeproj/vtmedia-schema.git
$ cd mediadata
$ export XSDPATH=~/git/vtmedia-schema/schemas
$ ./bin/movietest.sh
```

## Python Software Testing

| Repository | PyPi Release | Purpose |
| --- | --- | -- |
| [medialibrary](https://github.com/cjcodeproj/medialibrary) | [![PyPi version](https://img.shields.io/pypi/v/medialibrary)](https://pypi.org/project/medialibrary/) | Media API package |

Download the code repository from PyPi, or pull down the development branch if you are testing
unreleased features.  When the software is installed you can set an environmental variable 
with the path of the dataset.


```
$ mkdir git
$ cd git
$ git clone https://github.com/cjcodeproj/mediadata.git
$ python3 -m pip install --user medialibrary
$ export MEDIAPATH=~/git/mediadata
$ python3 -m media.tools.movies.list
```

# Repository Notes

## Branches

The `main` branch of this repository will always be usable with the `main` branches of the schema and 
Python code repository; meaning it will always be suitable for testing production code.

The `development` branch of this repository will almost always be consistent with the development
branches of the schema or the Python code.

## Contributing

Contributions for corrections to existing data will be accepted.  New title submissions will not
be accepted at this time.

If you want to generate new data for a given film, it should go in your own fork.

Future updates will be posted to this repository, but there is no set schedule.  New titles 
will be added in batches, under a separate branch, and then merged by a pull request.
