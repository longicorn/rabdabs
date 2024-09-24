# frozen_string_literal: true

require_relative "rabdabs/version"
require_relative "rabdabs/document"

module Rabdabs
  autoload :Middleware, "rabdabs/middleware"

  RSpec.configuration.before(:each) do |example|
    spec_results = Middleware.class_variable_get(:@@spec_results)
    spec_results << {example: example}
    Middleware.class_variable_set(:@@spec_results, spec_results)
  end

  RSpec.configuration.after(:suite) do |example|
    Document.generate
  end
end
