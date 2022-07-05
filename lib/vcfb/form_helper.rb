require "vcfb/form_builder"

module VCFB
  module FormHelper
    def component_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      options[:builder] ||= VCFB::FormBuilder
      if options[:builder].try(:form_component_defined?)
        render options[:builder].form_component_class.new(model: model, scope: scope, url: url, format: format, **options), &block
      else
        form_with(model: model, scope: scope, url: url, format: format, **options, &block)
      end
    end
  end
end
