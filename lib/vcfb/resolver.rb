require "active_support/core_ext/string/inflections"

module VCFB
  class Resolver
    def initialize(namespace, form_element)
      @namespace = namespace.to_s.underscore
      @form_element = form_element.to_s.underscore
    end

    def call
      "#{@namespace}/#{@form_element}/component".camelize.constantize
    end

    def self.call(namespace, form_element)
      new(namespace, form_element).call
    end
  end
end
