module Varager
  module Model

    class Env
      include Virtus.model
      attribute :id, Integer
      attribute :name, :String
      attribute :config, Hash
      attribute :created_at, Date
      attribute :updated_at, Date



      # def save!
      #   Varager.add_env(self.to_json)
      # end
      def conf_shell(with_export=false)
        config.each {|k,v| puts "#{with_export ? 'export ' : ''}#{k}='#{v}'"}
      end

      def conf_yaml
        config.each {|k,v| puts "#{k}: '#{v}'"}
      end

      def conf_k8s(indent=10)
        space = "#{" " * indent}"
        config.each {|k,v| puts "#{space}- name: #{k}\n#{space}  value:'#{v}'"}
      end

      def conf_json
        config.to_json
      end

      def add_var(key, value)
        Varager.add_vars(params: {id: self.name}, body: {config: {key => value}}.to_json)
      end

      def add_vars(dict)
        Varager.add_vars(params: {id: self.name}, body: {config: dict}.to_json)
      end

      def self.json_root
        @json_root = "environment"
      end

    end

    class Envs
      include Virtus.model
      attribute :environments, Array[Env]
    end

  end
end
