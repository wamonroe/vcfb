module Form
  module CollectionCheckBoxes
    module Label
      class Component < ViewComponent::Base
        include VCFB::ActsAsFormLabelComponent

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
