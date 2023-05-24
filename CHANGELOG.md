# CHANGELOG

## 2.2.0 - unreleased

- Refactored inheritance for simple inputs to support inherited ViewComponent
  templates.
- Added helper methods `resource` and `resource_errors?` to all components.
- Added helper methods `validation_errors` and `validation_errors?` to the label
  component and all other components responsible for rendering various inputs.

## 2.1.0

- Removed support for Ruby 2.7.

## 2.0.2

- Support for ViewComponent 2.61.0.

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
