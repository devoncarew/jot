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

-h, --help             Print this command help.
-o, --output           Configure the output directory.
                       (defaults to "doc/api")
    --[no-]markdown    Include LLM-friendly markdown summaries of the API.
                       (defaults to on)
    --signature        Write the package API in markdown format to doc/sig.
    --serve=<port>     Serve live docs from the documented package.
                       This serves on localhost and is useful for previewing docs while working on them.
```

## Markdown API summaries

Markdown summaries of the package's libraries are emitted into doc/markdown.
These are designed for use by agents and LLMs. They are a token dense
representation of the API; for example, for most symbols, the first markdown
sentence of the symbol is used (instead of the full dartdoc text). In a future
version, code examples in the documentation will be preserved (as these are
valuable to LLMs).

## Signature generation

Generate a markdown signature of the current API to doc/sig. This is a single
file that represents the current API. Changes in the public API of the package
will be reflected in changes to the signature file.

The file is normalized to eliminate non-semantic changes; symbols are lexically
sorted, ... . One symbol is emitted per line; no dartdoc is present in this
file.

## Infima and Docusaurus

The CSS page layout for this API generator are sourced from the
[Docusaurus](https://docusaurus.io/) project.
