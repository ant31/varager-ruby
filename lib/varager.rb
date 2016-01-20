require 'hashie'
require 'virtus'
require 'openapi'
require 'varager/auth_token'
require 'varager/models'
require 'varager/handlers'
require 'varager/routes'
require 'varager/client'

# LAST

## MOVE TO APP ""
require 'logger'
Varager.application_secret = "sk_test_2qITuuqhz7iuUExfIGHhBR"
Varager.site = "http://localhost:3000"
Varager.user = 'admin@email.com'
Varager.password = 'adminvarager'

Varager.logger = Logger.new(STDOUT)
OpenAPI.logger = Varager.logger
OpenAPI.cache = false

Varager::Routes.generate(Varager)
