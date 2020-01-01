ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'fixture_dependencies/helper_methods'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  include FixtureDependencies::HelperMethods

  FixtureDependencies.fixture_path = './test/fixtures'

  def run(*args, &block)
    Sequel::Model.db.transaction(:rollback=>:always){super}
  end
end
