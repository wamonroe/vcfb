require "rails"
require "view_component"
require "view_component/version"

module VCFB
  autoload :FormBuilder, "vcfb/form_builder"
  autoload :FormHelper, "vcfb/form_helper"
  autoload :Resolver, "vcfb/resolver"
  autoload :Template, "vcfb/template"

  module Tags
    autoload :CollectionCheckBoxes, "vcfb/tags/collection_check_boxes"
    autoload :CollectionHelpers, "vcfb/tags/collection_helpers"
    autoload :CollectionRadioButtons, "vcfb/tags/collection_radio_buttons"
  end

  module Errors
    autoload :ComponentMissing, "vcfb/errors/component_missing"
    autoload :Error, "vcfb/errors/error"
  end

  mattr_accessor :parent_component
  @@parent_component = defined?(ApplicationComponent) ? "ApplicationComponent" : "ViewComponent::Base"

  def self.configure
    yield self
  end

  module Component
    def self.setup!
      autoload :Base, "vcfb/component/base"
      autoload :BaseCollection, "vcfb/component/base_collection"
      autoload :BaseField, "vcfb/component/base_field"
      autoload :Button, "vcfb/component/button"
      autoload :CheckBox, "vcfb/component/check_box"
      autoload :CollectionCheckBoxes, "vcfb/component/collection_check_boxes"
      autoload :CollectionRadioButtons, "vcfb/component/collection_radio_buttons"
      autoload :CollectionSelect, "vcfb/component/collection_select"
      autoload :ColorField, "vcfb/component/color_field"
      autoload :DateField, "vcfb/component/date_field"
      autoload :DateSelect, "vcfb/component/date_select"
      autoload :DatetimeField, "vcfb/component/datetime_field"
      autoload :DatetimeSelect, "vcfb/component/datetime_select"
      autoload :Deprecated, "vcfb/component/deprecated"
      autoload :EmailField, "vcfb/component/email_field"
      autoload :FileField, "vcfb/component/file_field"
      autoload :Form, "vcfb/component/form"
      autoload :GroupedCollectionSelect, "vcfb/component/grouped_collection_select"
      autoload :Label, "vcfb/component/label"
      autoload :MonthField, "vcfb/component/month_field"
      autoload :NumberField, "vcfb/component/number_field"
      autoload :PasswordField, "vcfb/component/password_field"
      autoload :RadioButton, "vcfb/component/radio_button"
      autoload :RangeField, "vcfb/component/range_field"
      autoload :RichTextArea, "vcfb/component/rich_text_area"
      autoload :SearchField, "vcfb/component/search_field"
      autoload :Select, "vcfb/component/select"
      autoload :SimpleField, "vcfb/component/simple_field"
      autoload :Submit, "vcfb/component/submit"
      autoload :TelephoneField, "vcfb/component/telephone_field"
      autoload :TextArea, "vcfb/component/text_area"
      autoload :TextField, "vcfb/component/text_field"
      autoload :TimeField, "vcfb/component/time_field"
      autoload :TimeSelect, "vcfb/component/time_select"
      autoload :TimeZoneSelect, "vcfb/component/time_zone_select"
      autoload :UrlField, "vcfb/component/url_field"
      autoload :WeekField, "vcfb/component/week_field"
      autoload :WeekdaySelect, "vcfb/component/weekday_select"
    end
  end
end

require "vcfb/railtie"
