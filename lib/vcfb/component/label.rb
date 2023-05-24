module VCFB
  module Component
    class Label < BaseField
      delegate :translation, :to_s, to: :label_builder
      alias_method :default_text, :translation

      def initialize(form, method, text = nil, options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @text = text
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
        end
      end

      def form_element(options = {}, &block)
        label(@form.object_name, @method, options, &block)
      end

      private

      def label_builder
        @label_builder ||= ActionView::Helpers::Tags::Label::LabelBuilder
          .new(@form.template, @form.object_name, @method, @form.object, @options[:value])
      end
    end
  end
end
