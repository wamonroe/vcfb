require "active_support/core_ext/string/inflections"
require "rails/generators/base"

module Vcfb
  class ComponentsGenerator < ::Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    class_option :namespace, type: :string, default: "form"

    def create_button_component
      directory "button", "#{destination}/button"
    end

    def create_check_box_component
      directory "check_box", "#{destination}/check_box"
    end

    def create_collection_check_boxes_component
      directory "collection_check_boxes", "#{destination}/collection_check_boxes"
    end

    def create_collection_radio_buttons_component
      directory "collection_radio_buttons", "#{destination}/collection_radio_buttons"
    end

    def create_collection_select_component
      directory "collection_select", "#{destination}/collection_select"
    end

    def create_color_field_component
      directory "color_field", "#{destination}/color_field"
    end

    def create_date_field_component
      directory "date_field", "#{destination}/date_field"
    end

    def create_date_select_component
      directory "date_select", "#{destination}/date_select"
    end

    def create_datetime_field_component
      directory "datetime_field", "#{destination}/datetime_field"
    end

    def create_datetime_select_component
      directory "datetime_select", "#{destination}/datetime_select"
    end

    def create_email_field_component
      directory "email_field", "#{destination}/email_field"
    end

    def create_file_field_component
      directory "file_field", "#{destination}/file_field"
    end

    def create_grouped_collection_select_component
      directory "grouped_collection_select", "#{destination}/grouped_collection_select"
    end

    def create_label_component
      directory "label", "#{destination}/label"
    end

    def create_month_field_component
      directory "month_field", "#{destination}/month_field"
    end

    def create_number_field_component
      directory "number_field", "#{destination}/number_field"
    end

    def create_password_field_component
      directory "password_field", "#{destination}/password_field"
    end

    def create_radio_button_component
      directory "radio_button", "#{destination}/radio_button"
    end

    def create_range_field_component
      directory "range_field", "#{destination}/range_field"
    end

    def create_rich_text_area_component
      directory "rich_text_area", "#{destination}/rich_text_area"
    end

    def create_search_field_component
      directory "search_field", "#{destination}/search_field"
    end

    def create_select_component
      directory "select", "#{destination}/select"
    end

    def create_submit_component
      directory "submit", "#{destination}/submit"
    end

    def create_telephone_field_component
      directory "telephone_field", "#{destination}/telephone_field"
    end

    def create_text_area_component
      directory "text_area", "#{destination}/text_area"
    end

    def create_text_field_component
      directory "text_field", "#{destination}/text_field"
    end

    def create_time_field_component
      directory "time_field", "#{destination}/time_field"
    end

    def create_time_select_component
      directory "time_select", "#{destination}/time_select"
    end

    def create_time_zone_select_component
      directory "time_zone_select", "#{destination}/time_zone_select"
    end

    def create_url_field_component
      directory "url_field", "#{destination}/url_field"
    end

    def create_week_field_component
      directory "week_field", "#{destination}/week_field"
    end

    if Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new("7.0")
      def create_weekday_select_component
        directory "weekday_select", "#{destination}/weekday_select"
      end
    end

    private

    def destination
      if options[:skip_namespace]
        "app/components"
      else
        "app/components/#{options[:namespace]}"
      end
    end

    def module_namespacing(&block)
      content = capture(&block)
      content = wrap_with_namespace(content) unless options[:skip_namespace]
      concat(content)
    end

    def wrap_with_namespace(content)
      result = ""
      indent = 0
      namespace_parts = options[:namespace].split("/")
      namespace_parts.each do |module_name|
        result += indent("module #{module_name.camelize}\n", indent)
        indent += 2
      end
      result += indent(content, indent)
      namespace_parts.size.times do
        indent -= 2
        result += indent("end\n", indent)
      end
      result
    end
  end
end
