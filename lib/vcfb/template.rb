module VCFB
  # Several FormBuilder methods are more complex and have changed a good bit
  # between between Rails releases. Rather than trying to keep up with these
  # changes, we put together an intermediate Template class (see
  # VCFB::FormBuilder) to defer the compnetifying until _after_ it's gone
  # through ActionView::Helpers::FormBuilder.
  class Template
    def initialize(template, form)
      @template = template
      @form = form
    end

    # Custom Tag Helpers

    def button_tag(value, options)
      return super unless @form.component_defined?(:button)

      block = options.delete(:_block_for_component)
      @form.componentify_with_slots(:button, value, options, &block)
    end

    def submit_tag(value, options)
      return super unless @form.component_defined?(:submit)

      @form.componentify(:submit, value, options)
    end

    # Forward everything else to @template

    def send(method_name, *args, &block)
      @template.send(method_name, *args, &block)
    end

    def public_send(method_name, *args, &block)
      @template.public_send(method_name, *args, &block)
    end

    def method_missing(method_name, *args, &block)
      @template.public_send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      @template.respond_to?(method_name, include_private)
    end
  end
end
