Varager ruby wrapper
=======================
# Installation
```bash
gem install varager
```

# Configuration
```ruby
# Server endpoint
Varager.site = "http://localhost:3000" 

# Creds
Varager.user = "ant@gmail.com"
Varager.password = "totolala"

# Loggers
Varager.logger = Logger.new(STDOUT)
OpenAPI.logger = Varager.logger
```

# Usage
Auth is done once on the first call

## Environments
### List
```ruby
# Get all envs
envs = Varager.list_envs
#=>  #<Varager::Model::Envs>>
first_env = envs.environments[0]
#=> #<Varager::Model::Env>>
```
### Get 
```ruby
# 1. From http_client
env = Varager.get_env(params: {id: env_id})
#=> #<Varager::Model::Env>>
```
### Delete
```ruby
# 1. From http_client
env = Varager.get_env(params: {id: env_id})
#=> #<Varager::Model::Env>>

# 2. From model
env.delete!
```

## Add variables to an environment
```ruby
# 1. From http_client
env = Varager.add_vars(params: {id: env_id}, body: {config: {var1: value, var2: value2}}.to_json)
#=> #<Varager::Model::Env>>

# 2. From model
env.add_var(key, value)
env.add_vars({key1: value, key2: value2})
```
