# VCFB

[![Test](https://github.com/wamonroe/vcfb/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/wamonroe/vcfb/actions/workflows/test.yml)

> FormBuilder for Rails using ViewComponent

VCFB provides a `FormBuilder` for use with
[ViewComponent](https://viewcomponent.org/). It was inspired by
[ViewComponent::Form](https://github.com/pantographe/view_component-form), but
with the goal to make it easy to apply styling and other formatting within a
component's `.html.erb` file (rather than in Ruby code).

To further support this goal, if the application includes the
[TagOptions](https://github.com/wamonroe/tag_options) gem, `VCFB` will make use
of it when initializing `@options` and `@html_options` hashes.

## Table of Contents

- [Installation](#installation)
- [Getting Started](#getting-started)
- [Template Inheritance](#template-inheritance)
  - [SimpleField::Component](#simplefieldcomponent)
- [Settings](#settings)
- [Styling Components with TagOptions](#styling-components-with-tagoptions)
- [Development](#development)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "vcfb"
```

And then execute:

```sh
bundle install
```

## Getting Started

Generate a set components to use with VCFB::FormBuilder

```sh
rails generate vcfb:components
```

The generator will install view components for ALL of the form elements
supported by the version of Rails installed, including a component to generate
the form itself. By default, all of the components will be namespaced in `module Form`.

`VCFB::FormBuilder` with its default set of components renders form elements
functionaly identical to the the built-in Rails tag helpers. If, however, you
don't need or want to render certain form elements using a component it is safe
to delete the unused ones. `VCFB::FormBuilder` will fall back to rendering using
the built-in Rails tag helpers if a component for that element doesn't exist.

To generate components in a different namespace, use the `--namespace` option

```sh
rails generate vcfb:components --namespace inline_form
```

This will generate all the components under `module InlineForm`. To make use of
these namespaced components, create a custom `FormBuilder` in your application
inheriting from `VCFB::FormBuilder`.

```ruby
class InlineFormBuilder < VCFB::FormBuilder
  self.namespace = "inline_form"
end
```

To render forms using the generated components, use the included
`component_form_with` helper.

```erb
<%= component_form_with model: @author do |form| %>
  <%= form.label :name %>
  <%= form.text_field :name %>
<% end %>
```

If using a custom form builder inheriting from `VCFB::FormBuilder`, pass the
`:builder` option to `component_form_with`.

```erb
<%= component_form_with model: @author, builder: InlineFormBuilder do |form| %>
  <%= form.label :name %>
  <%= form.text_field :name %>
<% end %>
```

Generated components support `before_initialize`, `after_initialization`, and
`around_initialize` callbacks to minimize the need to override the initlialize
methods.

```ruby
module Form
  module Label
    after_initialize :set_component_options

    private

    def set_component_options
      @size = @options.delete(:size) || :default
    end
  end
end
```

## Template Inheritance

After version 2.2.0, form components are generated with the following hierarchy.
Children components are not generated with templates, but rather fall back to
the template used by their parent. To customize a child component, create a file
named `component.html.erb` in the child component's directory.

- Button::Component
- CheckBox::Component
- CollectionCheckBoxes::Component
- CollectionRadioButtons::Component
- CollectionSelect::Component
- DateSelect::Component
- DatetimeSelect::Component
- Form::Component
- GroupedCollectionSelect::Component
- Label::Component
- RadioButton::Component
- Select::Component
- SimpleField::Component
  - ColorField::Component
  - DateField::Component
  - DatetimeField::Component
  - EmailField::Component
  - FileField::Component
  - MonthField::Component
  - NumberField::Component
  - PasswordField::Component
  - RangeField::Component
  - RichTextArea::Component
  - SearchField::Component
  - TelephoneField::Component
  - TextArea::Component
  - TextField::Component
  - TimeField::Component
  - UrlField::Component
  - WeekField::Component
- Submit::Component
- TimeSelect::Component
- TimeZoneSelect::Component
- WeekdaySelect::Component

### SimpleField::Component

By default `SimpleField::Component` infers the form field to use based on the
name of the component. If you are creating a custom form component, or otherwise
need to customize this behavior, define a `form_field_name` on your component,
returning the name of the Rails form helper method to call. For example:

```ruby
module Form
  module CurrencyField
    class Component < SimpleField::Component
      # ...

      private

      def form_field_name
        "text_field"
      end
    end
  end
end
```

## Settings

By default, components will inherit from `ApplicationComponent` if it exists or
`ViewComponent::Base` if it does not. If you wish to change this behavior,
generate an initializer and specify the `parent_component`.

```sh
rails generate vcfb:initializer
```

```ruby
VCFB.configure do |config|
  config.parent_component = "MyCustomBaseComponent"
end
```

## Styling Components with TagOptions

> The examples below use `TagOptions::Hash` to make it easy to manipulate
> options passed to generate the form elements. See
> [TagOptions](https://github.com/wamonroe/tag_options) for more information
> about the options available.

For form elements, `VCFB` provides a `form_element` helper that will render
the field, select, button, etc.

The `button`, `check_box`, `label`, `radio_buton`, `rich_text_area`, `submit`,
`text_area` and all the `*_field` elements are styled using only an `@options`
hash.

```erb
<%# app/components/form/text_field/component.html.erb %>
<%= form_element @options.at(:class).combine!("shadow-sm block border-gray-300 rounded-md") %>
```

The `collection_check_boxes`, `collection_radio_buttons`, `select`, and all of
the `*_select` elements have an `@options`, but are styled with an
`@html_options` hash.

```erb
<%# app/components/form/select/component.html.erb %>
<%= form_element @options, @html_options.at(:class).combine!("shadow-sm block border-gray-300 rounded-md") %>
```

The main form element is rendered with a `form_tag` helper and is styled with an `@options` hash.

```erb
<%# app/components/form/component.html.erb %>
<%= form_tag @options.at(:class).combine!("mt-8 space-y-6") do |form| %>
  <%= content %>
<% end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/rspec` to run the tests. You can also run:

- `bin/console` for an interactive prompt that will allow you to experiment
- `bin/rubocop` to run RuboCop to check the code style and formatting

To build this gem on your local machine, run `bundle exec rake build`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/wamonroe/vcfb.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).
