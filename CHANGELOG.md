# CHANGELOG

## Main

-

## 2.0.1

- Restore usage of tag options gem if present.

## 2.0.0

- Support rendering of the base form tag via component (including slot support
  for ViewComponent v2.54.0 and above).
- Support rendering of slots for button, label, collection checkbox label, and
  collection radio button label components for ViewComponent v2.54.0 and above.
- Extracted form component logic out of generated components to ease future
  updates.
- Added the `vcfb:initializer` generator.

> **Breaking Change**: If you have previously run the component generator, you
> will need to re-run `vcfb:component` and merge the changes into your existing
> components.

## 1.0.0

- Initial release
