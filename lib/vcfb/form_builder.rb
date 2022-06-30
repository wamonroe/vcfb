require "active_support/core_ext/class/attribute"
require "view_component"

require "vcfb/acts_as_form_component"
require "vcfb/acts_as_form_collection_component"
require "vcfb/acts_as_form_label_component"
require "vcfb/resolver"
require "vcfb/template"

module VCFB
  class FormBuilder < ::ActionView::Helpers::FormBuilder
    class_attribute :namespace, instance_writer: false, default: "form"

    attr_reader :object, :object_name, :template

    def initialize(*args)
      super
      @template = Template.new(@template, self)
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

    SIMPLE_SELECTS = %i[date_select datetime_select time_select weekday_select]
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
      if component_defined?(:"collection_radio_buttons/label")
        componentify(:"collection_radio_buttons/label", method, text, options, &block)
      elsif component_defined?(:label)
        componentify(:label, method, text, options, &block)
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

      componentify(:label, method, text, objectify_options(options), &block)
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

    # COMPONENT LOOKUP

    def component_defined?(form_element)
      resolve_form_component(form_element).present?
    rescue
      false
    end

    def componentify(form_element, *args, **opts, &block)
      form_component_class = resolve_form_component(form_element)
      @template.render form_component_class.new(self, *args, **opts), &block
    end

    private

    def resolve_form_component(form_element)
      VCFB::Resolver.call(namespace, form_element)
    end
  end
end
