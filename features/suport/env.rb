require 'cucumber'
require 'httparty'
require 'logging'
require 'rspec'
require 'active_support/all'
require 'json-schema'
require 'json_matchers'
require 'json_matchers/rspec'


include RSpec::Matchers #declaração para que os testes tenham acesso aos matchers do rspec e ter permissão para uso do expect dentro de métodos
