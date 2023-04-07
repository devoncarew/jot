[![package:jot](https://github.com/devoncarew/jot/actions/workflows/dart.yaml/badge.svg)](https://github.com/devoncarew/jot/actions/workflows/dart.yaml)

An experimental documentation generator for Dart.

## What's this?

An experimental documentation generator for Dart; the main design features are:

- fast generation
- output one page per library and per class (instead of a page per symbol)
- output rendered in a SPA web app
- few configuration options for the CLI tool
- designed to be used as a library for sophisticated use cases (documenting the
  Dart SDK, the Flutter SDK, ...)

## Command-line usage

```
Generate API documentation for Dart projects.

usage: dart bin/jot.dart <options> [<directory>]

-h, --help            Print this command help.
-o, --output          Configure the output directory.
                      (defaults to "doc/api")
    --serve=<port>    Serve live docs from the documented package.
                      This only serves on localhost and is generally used during
                      development in an edit/refresh workflow.
```

## Infima and Docusaurus

The CSS page layout for this API generator are sourced from the excellent
[Infima](https://infima.dev/) and [Docusaurus](https://docusaurus.io/) projects.
