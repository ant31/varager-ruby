module Varager

  module Routes
    class << self
      def generate(client=Varager)
        OpenAPI::Route.draw(client) do
          ## AUTH
          match "users/sign_in", "varager/handlers/app_response#response", :auth, via: :post, :options => {:skip_auth => true}

          ## ENVS
          match "api/environments", "varager/handlers/app_response#envs", :list_envs, via: :get
          match "api/environments/:id", "varager/handlers/app_response#env", :get_env, via: :get
          match "api/environments/:id", "varager/handlers/app_response#env", :delete_env, via: :delete
          match "api/environments/:id", "varager/handlers/app_response#env", :add_vars, via: :put

          ## USERS
          match "api/users", "varager/handlers/app_response#response", :list_users, via: :get

          # CRUD CALLS
          match "GET", "varager/handlers/app_response#response", :GET, via: :get
          match "DELETE", "varager/handlers/app_response#response", :DELETE, via: :get
          match "PUT", "varager/handlers/app_response#response", :PUT, via: :get
          match "POST", "varager/handlers/app_response#response", :POST, via: :post
        end
      end
    end
  end
end
