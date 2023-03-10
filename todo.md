## Model elements

- item (documentable, backed by an element)
- items

## Testing

- fast
- simple

## Html output

- clean
- small

## Page layout and nav

- similar to dart.dev
- integrated
- clean

## Search

- simple, comprehensive

## Generation

- fast
- no args
- configuration via a yaml file
- cli just supports documenting packages
- more sophisticated use cases (dart sdk, flutter) should use the package as a
  library


## single package workspace

todo: addChild(displayname, location, docfile)

- index.html (main file)  / index.html
- CHANGELOG.md (nav file) "CHANGELOG.md" / CHANGELOG.md
- foo.md "foo.md" / foo.md
- doc/bar.md "doc/bar.md" / doc/bar.md
- my_library.html (main file)
- my_library/ClassA.html
- my_library/Classb.html
- helpers/library2.html (main file)
- helpers/library2/ClassC.html

## multiple package workspace (SDK, ...)

- todo:
