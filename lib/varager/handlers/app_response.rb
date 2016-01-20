module Varager
  module Handlers
    class AppResponse < OpenAPI::Handler
      class << self
        def method_missing(method_symbol, *arguments) #:nodoc:
          method_name = method_symbol.to_s
          return self.send :const_model, method_name, *arguments
        end

        private

        def const_model(snake_name, response, options)
          klass_name = snake_name.camelize
          hash = JSON.parse(response.raw)
          klass = Varager::Model.const_get(klass_name)
          if klass.respond_to?(:json_root)
            hash = hash[klass.json_root]
          end
          resp = klass.new(hash)
          return OpenAPI::Handlers::Response.wrap(resp, response)
        end

      end
    end
  end
end
