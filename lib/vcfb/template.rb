module VCFB
  class Template
    def initialize(template, form)
      @template = template
      @form = form
    end

    # Custom Tag Helpers

    def button_tag(value, options, &block)
      return super unless @form.component_defined?(:button)

      if block
        value = @template.capture(value, &block)
      end

      @form.componentify(:button, value, options)
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
