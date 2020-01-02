# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'sequel'

Sequel.connect( ENV['DATABASE_URL'])

run Rails.application
