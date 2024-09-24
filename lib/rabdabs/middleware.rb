# frozen_string_literal: true

module Rabdabs
  class Middleware
    def initialize(app, args = {})
      @app = app
      @@spec_results = []
    end

    def call(env)
      status, headers, response = @app.call(env)

      spec_results = Middleware.class_variable_get(:@@spec_results)
      spec_result = spec_results.last
      spec_result[:response] = response.instance_values['response']
      spec_results[-1] = spec_result
      Middleware.class_variable_set(:@@spec_results, spec_results)

      [status, headers, response]
    rescue => e
      [status, headers, response]
    end
  end
end
