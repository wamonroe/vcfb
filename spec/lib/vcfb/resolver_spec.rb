require "vcfb/resolver"

module Form
  module Example
    class Component < ViewComponent::Base; end
  end

  module Examples
    class Component < ViewComponent::Base; end
  end

  module Nested
    module Example
      class Component < ViewComponent::Base; end
    end
  end
end

RSpec.describe VCFB::Resolver do
  context ".call" do
    it "resolves a form component" do
      expect(described_class.call("form", "example"))
        .to eq(Form::Example::Component)
    end

    it "resolves a plural form component" do
      expect(described_class.call("form", "examples"))
        .to eq(Form::Examples::Component)
    end

    it "resolves a nested form component" do
      expect(described_class.call("form", "nested/example"))
        .to eq(Form::Nested::Example::Component)
    end

    it "raises an error if the form component doesn't exist" do
      expect { described_class.call("form", "missing_form component") }
        .to raise_error(VCFB::Errors::ComponentMissing)
    end
  end
end
