# Explanation of how to get the app up and running:

The following gives you a very basic app which shows you how to get started with using fixtures in a rails app using:

(i) Sequel
(ii) Minitest (not minitest spec )
(iii) Rails

* I have used the sequest_rails gem to get started. Follow the instructions contained in that gem's Readme.
* I have created a `test/sequel_test_case.rb` file which contains:

```ruby
DB = Sequel.postgres 

class SequelTestCase < Minitest::Test
  def run(*args, &block)
    DB.transaction(:rollback=>:always, :auto_savepoint=>true){super}
  end
end
```

But if you are using the fixtures_dependency gem, then you can add the following in your `test_helper.rb` file.

```ruby
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
```

Then I created a hello world test in a file I created: `test/models/organisation_test.rb`


```ruby
require 'test_helper'
require 'sequel_test_case'

class OrganisationTest < SequelTestCase
  def test_organisation_name
    assert_equal(true, true) ## This test passes as expected.
  end
end

```

### Adding a fixture

* I have created an Organisation scaffold which has one attribute: name.

Don't forget to add a plugin so that it works just like rails:

```ruby
# app/models/organisation.rb
class Organisation < Sequel::Model
  Sequel::Model.plugin :active_model
end

```

The fixture I have created is an `organisation.yml` file located in `text/fixtures/organisation.yml`. 

```yml
one:
  name: MyString

two:
  name: MyString
```

### Setting up the fixture

I went to the `organisation_test.rb` and added the line ` require 'fixture_dependencies/test_unit/sequel'` and I also changed the class from which OrganisationTest was inheriting from:

```ruby
require 'test_helper'
require 'sequel_test_case'

require 'fixture_dependencies/test_unit/sequel'

class OrganisationTest < FixtureDependencies::SequelTestCase
  def test_organisation_name
    organisation = load(:organisation__one)
    assert_equal(organisation.name, "BadBoys")
  end
end
```

### Run the tests:

Go to your terminal and run `bin/rake` and the tests should run!
