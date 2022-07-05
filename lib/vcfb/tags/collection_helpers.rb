module VCFB
  module Tags
    module CollectionHelpers
      private

      def form
        @template_object.instance_variable_get(:@form)
      end

      def label_html_options(extra_html_options)
        html_options = @input_html_options.slice(:index, :namespace).merge(extra_html_options)
        html_options[:for] ||= @input_html_options[:id] if @input_html_options[:id]
        html_options
      end
    end
  end
end
