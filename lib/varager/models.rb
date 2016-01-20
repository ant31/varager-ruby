$:.unshift(File.dirname(__FILE__))
module Varager
  module Model
    autoload :Response, "models/response"
    autoload :Env, "models/env"
    autoload :Envs, "models/env"

    class Hashie < Virtus::Attribute
      def coerce(value)
        ::Hashie::Mash.new(value)
      end
    end

  end
end
