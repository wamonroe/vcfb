module VCFB
  class FormBuilder < ::ActionView::Helpers::FormBuilder
    class_attribute :namespace, instance_writer: false, default: "form"

    attr_reader :object, :object_name, :template
    attr_accessor :form_component

    def initialize(*args)
      super
      @template = Template.new(@template, self)
    end

    # FORM COMPONENT

    def self.form_component_class
      "#{namespace}/component".camelize.constantize
    end

    def self.form_component_defined?
      form_component_class.present?
    rescue Errors::ComponentMissing
      false
    end

    # SIMPLE FIELDS

    SIMPLE_FIELDS = %i[color_field date_field datetime_field email_field month_field number_field password_field
      range_field search_field telephone_field text_area text_field time_field url_field week_field]

    SIMPLE_FIELDS.each do |selector|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
        def #{selector}(method, options = {})
          return super unless component_defined?(#{selector.inspect})

          componentify(#{selector.inspect}, method, objectify_options(options))
        end
      RUBY_EVAL
    end

    alias_method :phone_field, :telephone_field
    alias_method :datetime_local_field, :datetime_field

    # SIMPLE SELECTS

    SIMPLE_SELECTS = %i[date_select datetime_select time_select]
    SIMPLE_SELECTS.each do |selector|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
        def #{selector}(method, options = {}, html_options = {})
          return super unless component_defined?(#{selector.inspect})

          componentify(#{selector.inspect}, method, objectify_options(options), html_options)
        end
      RUBY_EVAL
    end

    # MORE COMPLEX FIELDS AND SELECTS

    def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      return super unless component_defined?(:check_box)

      componentify(:check_box, method, objectify_options(options), checked_value, unchecked_value)
    end

    def collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      return super unless component_defined?(:collection_check_boxes)

      componentify(:collection_check_boxes, method, collection, value_method, text_method, objectify_options(options), @default_html_options.merge(html_options), &block)
    end

    def collection_check_boxes_label(method, text = nil, options = {}, &block)
      options, text = text, nil if text.is_a?(Hash)
      if component_defined?(:"collection_check_boxes/label")
        componentify(:"collection_check_boxes/label", method, text, options, &block)
      elsif component_defined?(:label)
        componentify(:label, method, text, options, &block)
      else
        label(method, text, options, &block)
      end
    end

    def collection_check_boxes_check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      if component_defined?(:"collection_check_boxes/check_box")
        componentify(:"collection_check_boxes/check_box", method, options, checked_value, unchecked_value)
      elsif component_defined?(:check_box)
        componentify(:check_box, method, options, checked_value, unchecked_value)
      else
        check_box(method, options, checked_value, unchecked_value)
      end
    end

    def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      return super unless component_defined?(:collection_radio_buttons)

      componentify(:collection_radio_buttons, method, collection, value_method, text_method, objectify_options(options), @default_html_options.merge(html_options), &block)
    end

    def collection_radio_buttons_label(method, text = nil, options = {}, &block)
      options, text = text, nil if text.is_a?(Hash)
      if component_defined?(:"collection_radio_buttons/label")
        componentify_with_slots(:"collection_radio_buttons/label", method, text, options, &block)
      elsif component_defined?(:label)
        componentify_with_slots(:label, method, text, options, &block)
      else
        label(method, text, options, &block)
      end
    end

    def collection_radio_buttons_radio_button(method, value, options = {})
      if component_defined?(:"collection_radio_buttons/radio_button")
        componentify(:"collection_radio_buttons/radio_button", method, value, options)
      elsif component_defined?(:radio_button)
        componentify(:radio_button, method, value, options)
      else
        radio_button(method, options, checked_value, unchecked_value)
      end
    end

    def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      return super unless component_defined?(:collection_select)

      componentify(:collection_select, method, collection, value_method, text_method, objectify_options(options), @default_html_options.merge(html_options))
    end

    def file_field(method, options = {})
      return super unless component_defined?(:file_field)

      self.multipart = true
      componentify(:file_field, method, objectify_options(options))
    end

    def grouped_collection_select(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
      return super unless component_defined?(:grouped_collection_select)

      componentify(:grouped_collection_select, method, collection, group_method, group_label_method, option_key_method, option_value_method, objectify_options(options), @default_html_options.merge(html_options))
    end

    def label(method, text = nil, options = {}, &block)
      return super unless component_defined?(:label)

      options, text = text, nil if text.is_a?(Hash)
      componentify_with_slots(:label, method, text, objectify_options(options), &block)
    end

    def radio_button(method, value, options = {})
      return super unless component_defined?(:radio_button)

      componentify(:radio_button, method, value, objectify_options(options))
    end

    def rich_text_area(method, options = {})
      return super unless component_defined?(:rich_text_area)

      componentify(:rich_text_area, method, objectify_options(options))
    end

    def select(method, choices = nil, options = {}, html_options = {}, &block)
      return super unless component_defined?(:select)

      componentify(:select, method, choices, objectify_options(options), @default_html_options.merge(html_options), &block)
    end

    def time_zone_select(method, priority_zones = nil, options = {}, html_options = {})
      return super unless component_defined?(:time_zone_select)

      componentify(:time_zone_select, method, priority_zones, objectify_options(options), @default_html_options.merge(html_options))
    end

    if Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new("7.0")
      def weekday_select(method, options = {}, html_options = {})
        return super unless component_defined?(:weekday_select)

        componentify(:weekday_select, method, objectify_options(options), html_options)
      end
    end

    # BUTTONS

    # The default #button method captures the block (it never makes it to the
    # underlying button_tag helper). Stash it here into options so that we can
    # pull it out later (see vcfb/template) and pass it on to the component so
    # that we can support slots on button components.
    def button(value = nil, options = {}, &block)
      options[:_block_for_component] = block
      super(value, options, &nil)
    end

    # COMPONENT SUPPORT

    def component_defined?(form_element)
      resolve_component_class(form_element).present?
    rescue Errors::ComponentMissing
      false
    end

    def componentify(form_element, *args, **opts, &block)
      component_class = resolve_component_class(form_element)
      @template.render component_class.new(self, *args, **opts), &block
    end

    def componentify_with_slots(form_element, *args, **opts, &block)
      component_class = resolve_component_class(form_element)
      @template.render component_class.new(self, *args, **opts) do |component|
        block&.call(component)
      end
    end

    def resolve_component_class(form_element)
      VCFB::Resolver.call(namespace, form_element)
    end

    # SUPPORT FORM COMPONENT SLOTS

    def method_missing(method_name, *args, **opts, &block)
      super unless method_name.to_s.start_with?("with_")

      form_component.public_send(method_name, *args, **opts, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      super unless method_name.to_s.start_with?("with_")

      form_component.respond_to?(method_name, include_private)
    end
  end
end
