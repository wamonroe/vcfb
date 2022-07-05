module Form
  class Component < ViewComponent::Base
    include VCFB::ActsAsBaseFormComponent
    attr_reader :form

    def initialize(model: nil, scope: nil, url: nil, format: nil, **options)
      @model = model
      @scope = scope
      @url = url
      @format = format
      @options = options
    end

    def form_tag(options = {}, &block)
      form_with(model: @model, scope: @scope, url: @url, format: @format, **options) do |form|
        form.form_component = self if form.respond_to?(:form_component=)
        @form = form
        block&.call(@form)
      end
    end
  end
end
