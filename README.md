# VCFB

FormBuilder for Rails using ViewComponent

VCFB provides a `FormBuilder` for use with
[ViewComponent](https://viewcomponent.org/). It was inspired by
[ViewComponent::Form](https://github.com/pantographe/view_component-form), but
with the goal to make it easy to apply styling and other formatting within a
component's `.html.erb` file (rather than in Ruby code).

To further support this goal, if the application includes
[TagOptions](https://github.com/wamonroe/tag_options), the `vcfb:components`
will make use of it when saving `options` and `html_options` hashes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "vcfb"
```

And then execute:

```sh
bundle install
```

## Usage

Generate a set components to use with VCFB::FormBuilder

```sh
rails generate vcfb:components
```

The generator will install view components for ALL of the form elements
supported by the version of Rails installed. By default, all of the components
will be namespaced in `module Form`.

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/rspec` to run the tests. You can also run:

- `bin/console` for an interactive prompt that will allow you to experiment
- `bin/rubocop` to run RuboCop to check the code style and formatting

To install this gem onto your local machine, run `bundle exec rake install`. To
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
