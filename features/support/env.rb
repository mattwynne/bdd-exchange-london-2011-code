ENV['RACK_ENV'] = 'test'
require File.dirname(__FILE__) + '/../../lib/app'

require 'capybara/dsl'
Capybara.app = Sinatra::Application