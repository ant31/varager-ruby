module Varager
  class AuthToken < OpenAPI::AuthToken

    def initialize
      super ({"expires_in" => 3600,
              "header" => "Authorization",
              "header_format" => "%s"})
    end

    def new_auth_token()
      auth_response = Varager.auth(body: {user: {email: Varager.user, password: Varager.password}}.to_json)
      update({"token" => auth_response.authentication_token})
    end

  end
end
