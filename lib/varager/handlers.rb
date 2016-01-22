$:.unshift(File.dirname(__FILE__))

module Varager
  module Handlers
    autoload :Model, "handlers/json"
    autoload :Array, "handlers/json"
  end
end
