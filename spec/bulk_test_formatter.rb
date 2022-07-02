require "rspec/core/formatters/base_formatter"
require "rspec/core/formatters/console_codes"

class BulkTestFormatter < RSpec::Core::Formatters::BaseFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed, :dump_summary

  def example_passed(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap(".", :success)
  end

  def example_pending(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap("*", :pending)
  end

  def example_failed(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap("F", :failure)
  end

  def dump_summary(summary)
    output.puts "\n#{summary.colorized_totals_line}\n\n"
  end
end
