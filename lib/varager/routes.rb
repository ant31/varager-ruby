module Varager

  module Routes
    class << self
      def generate(client=Varager)
        OpenAPI::Route.draw(client) do
          ## AUTH
          match "users/sign_in", "varager/handlers/model#response", :auth, via: :post, :options => {:skip_auth => true}

          ## ENVS
          match "environments", "varager/handlers/array#env", :list_envs, via: :get
          match "environments/:id", "varager/handlers/model#env", :get_env, via: :get
          match "environments/:id", "varager/handlers/model#env", :delete_env, via: :delete
          match "environments/:id/addvars", "varager/handlers/model#env", :add_vars, via: :post

          ## USERS
          match "environments/:environment_id/users", "varager/handlers/array#response", :list_env_users, via: :get
          match "users", "varager/handlers/array#response", :list_users, via: :get

          # CRUD CALLS
          match "GET", "varager/handlers/model#response", :GET, via: :get
          match "DELETE", "varager/handlers/model#response", :DELETE, via: :get
          match "PUT", "varager/handlers/model#response", :PUT, via: :get
          match "POST", "varager/handlers/model#response", :POST, via: :post
        end
      end
    end
  end
end
