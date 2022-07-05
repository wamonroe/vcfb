module VCFB
  class Resolver
    def initialize(namespace, form_element = nil)
      @namespace = namespace.to_s.underscore
      @form_element = form_element.to_s.underscore unless form_element.nil?
    end

    def call
      component_name = "#{[@namespace, @form_element].compact.join("/")}/component"
      component = component_name.camelize.safe_constantize
      raise Errors::ComponentMissing, "unable to locate component #{component_name}" unless component

      component
    end

    def self.call(namespace, form_element = nil)
      new(namespace, form_element).call
    end
  end
end
