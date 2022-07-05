module SlotForm
  module CollectionRadioButtons
    module Label
      class Component < VCFB::Component::Label
        after_initialize :set_component_options

        if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
          renders_one :icon, ->(name) do
            content_tag(:i, nil, class: "fa fa-#{name}")
          end
        end

        private

        def set_component_options
          @size = @options.delete(:size) || :default
        end
      end
    end
  end
end
