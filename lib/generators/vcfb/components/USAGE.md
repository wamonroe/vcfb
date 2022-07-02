Description:
Creates a set of form components for use with VCFB::FormBuilder. You can
optionally pass a namespace (defaults to "form") that the components will be
generated under.

Examples:
`rails generate vcfb:components [--namespace NAMESPACE]`

        Creates the following ViewComponents:

            app/components/form/button/component.html.erb
            app/components/form/button/component.rb
            app/components/form/check_box/component.html.erb
            app/components/form/check_box/component.rb
            app/components/form/collection_check_boxes/component.html.erb
            app/components/form/collection_check_boxes/component.rb
            app/components/form/collection_radio_buttons/component.html.erb
            app/components/form/collection_radio_buttons/component.rb
            app/components/form/collection_select/component.html.erb
            app/components/form/collection_select/component.rb
            app/components/form/color_field/component.html.erb
            app/components/form/color_field/component.rb
            app/components/form/date_field/component.html.erb
            app/components/form/date_field/component.rb
            app/components/form/date_select/component.html.erb
            app/components/form/date_select/component.rb
            app/components/form/datetime_field/component.html.erb
            app/components/form/datetime_field/component.rb
            app/components/form/datetime_select/component.html.erb
            app/components/form/datetime_select/component.rb
            app/components/form/email_field/component.html.erb
            app/components/form/email_field/component.rb
            app/components/form/file_field/component.html.erb
            app/components/form/file_field/component.rb
            app/components/form/grouped_collection_select/component.html.erb
            app/components/form/grouped_collection_select/component.rb
            app/components/form/label/component.html.erb
            app/components/form/label/component.rb
            app/components/form/month_field/component.html.erb
            app/components/form/month_field/component.rb
            app/components/form/number_field/component.html.erb
            app/components/form/number_field/component.rb
            app/components/form/password_field/component.html.erb
            app/components/form/password_field/component.rb
            app/components/form/radio_button/component.html.erb
            app/components/form/radio_button/component.rb
            app/components/form/range_field/component.html.erb
            app/components/form/range_field/component.rb
            app/components/form/rich_text_area/component.html.erb
            app/components/form/rich_text_area/component.rb
            app/components/form/search_field/component.html.erb
            app/components/form/search_field/component.rb
            app/components/form/select/component.html.erb
            app/components/form/select/component.rb
            app/components/form/submit/component.html.erb
            app/components/form/submit/component.rb
            app/components/form/telephone_field/component.html.erb
            app/components/form/telephone_field/component.rb
            app/components/form/text_area/component.html.erb
            app/components/form/text_area/component.rb
            app/components/form/text_field/component.html.erb
            app/components/form/text_field/component.rb
            app/components/form/time_field/component.html.erb
            app/components/form/time_field/component.rb
            app/components/form/time_select/component.html.erb
            app/components/form/time_select/component.rb
            app/components/form/time_zone_select/component.html.erb
            app/components/form/time_zone_select/component.rb
            app/components/form/url_field/component.html.erb
            app/components/form/url_field/component.rb
            app/components/form/week_field/component.html.erb
            app/components/form/week_field/component.rb
            app/components/form/weekday_select/component.html.erb
            app/components/form/weekday_select/component.rb"
