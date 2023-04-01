# TODO

- [x] script for doc'ing the dart sdk
- [ ] script for doc'ing flutter
- [ ] tests for workspace code
- [ ] cleaner gen?
- [ ] libraries should have a section for symbols exported from other libs
- [ ] classes should have a section for symbols inherited from parent classes
- [ ] use pragmas to control dartdoc specific imports
- [ ] support front-matter for markdown files?

## Model elements

- [x] item (documentable, backed by an element)
- [x] items
- [x] group and group ordering

## Testing

- [ ] fast
- [ ] simple

## Html output

- [x] clean
- [ ] small
- [ ] smaller css
- [ ] version the css (from Infima)

## Page layout and nav

- [x] dart script
- [x] full SPA
- [ ] manage the scroll during page transitions

## Search

- [ ] simple, comprehensive

## Server

- [x] have a server mode; allow preview of docs, and refreshing will pick up file
  changes and re-generate (to allow a quick edit-refresh workflow for updating
  docs)

## Generation

- [x] no args
- [x] cli just supports documenting packages
- [x] more sophisticated use cases (dart sdk, flutter) should use the package as a
  library
- [x] fast
- [ ] configuration via a yaml file

## Fixes

- [ ] fix issues with top-level vars vs. getters vs setters in the model
- [ ] have a method to convert from an element to a valid in-page ID (we're using
  the element name currently but that's not robust, like for operator names)
