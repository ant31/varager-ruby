$:.unshift(File.dirname(__FILE__))

module Varager
  module Handlers
    autoload :AppResponse, "handlers/app_response"
  end
end
