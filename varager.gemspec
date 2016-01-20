require 'rake'
require 'date'
require File.join(File.dirname(__FILE__), 'lib/varager/version')

Gem::Specification.new do |s|
  s.name = 'varager'
  s.version = ::Varager::VERSION
  s.licenses = ['MIT']
  s.date = Date.today.to_s
  s.summary = 'A Ruby wrapper for the Varager API'
  s.description = 'varager is a Ruby library for interacting with the Varager API.'
  s.homepage = 'http://github.com/ant31/openapi-varager'
  s.authors = ['Antoine Legrand']
  s.email = ['ant.legrand@gmail.com']
  s.files = FileList['README.md', 'LICENSE', 'Changelog','Rakefile', 'lib/**/*.rb'].to_a
  s.test_files = FileList['spec/**/*.rb'].to_a

  s.add_dependency 'openapi', [ ">=0.10" ]
  s.add_dependency 'virtus', [ "~> 1" ]
  s.add_dependency 'hashie', [ ">= 1" ]

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakeweb'

  s.required_ruby_version = '>= 1.9.2'
end
