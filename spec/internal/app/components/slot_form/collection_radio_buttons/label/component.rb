module SlotForm
  module CollectionRadioButtons
    module Label
      class Component < ViewComponent::Base
        include VCFB::ActsAsFormLabelComponent

        if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
          renders_one :icon, ->(name) do
            content_tag(:i, nil, class: "fa fa-#{name}")
          end
        end

        def initialize(form, method, text = nil, options = {})
          @form = form
          @method = method
          @text = text
          @options = options
        end

        def form_element(options = {}, &block)
          label(@form.object_name, @method, options, &block)
        end
      end
    end
  end
end
