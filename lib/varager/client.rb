require 'json'
require 'net/https'
require 'time'
require 'base64'

#require File.join(File.dirname(__FILE__), '../../response')
module Varager
  module ClassMethods
    include OpenAPI::ClassMethods
    attr_accessor :user, :password

    def build_path(path, params=nil)
      uri = URI("/#{path}.json")
      if params != nil
        uri.query = URI.encode_www_form(params)
      end
      return uri
    end

    def auth_token
      @auth_token ||= Varager::AuthToken.new
    end
  end

  class << self
    include ClassMethods
  end

  class Client
    include ClassMethods

    def initialize(options={})
      @user = options[:user] || Varager.user
      @password = options[:password] || Varager.password
      @logger = options[:logger] || Varager.logger
      @site = options[:site] || Varager.site
      @request_timeout = options[:request_timeout] || Varager.request_timeout || 5
      @max_retry = options[:max_retry] || Varager.max_retry ||  2
      Varager::Routes.generate(self)
      # init handlers
    end
  end
end
