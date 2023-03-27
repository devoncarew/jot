## todo

+ script for doc'ing the dart sdk
- script for doc'ing flutter
- tests for workspace code
- cleaner gen?
- abstract the html generation?
- libraries should have a section for symbols exported from other libs
- classes should have a section for symbols inherited from parent classes
- use pragmas to control dartdoc specific imports
- support front-matter for markdown files?

## Model elements

+ item (documentable, backed by an element)
+ items
+ group and group ordering

## Testing

- fast
- simple

## Html output

- clean
- small

## Page layout and nav

+ dart script
+ full SPA

## Search

- simple, comprehensive

## Server

- have a server mode; allow preview of docs, and refreshing will pick up file
  changes and re-generate (to allow a quick edit-refresh workflow for updating
  docs)

## Generation

+ no args
+ cli just supports documenting packages
+ more sophisticated use cases (dart sdk, flutter) should use the package as a
  library
+ fast
- configuration via a yaml file

## Misc

- have a method to convert from an element to a valid in-page ID (we're using
  the element name currently but that's not robust, like for operator names)

## API

- fix issues with top-level vars vs. getters vs setters in the model
