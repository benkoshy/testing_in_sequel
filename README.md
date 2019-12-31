# Steps to reproduce

I am trying to get a 'hello world' sample test working with sequel and minitest using fixtures.

* I have used the sequest_rails gem to get started.
* I have created a `test/sequel_test_case.rb` file which contains:

```ruby
DB = Sequel.postgres 

class SequelTestCase < Minitest::Test
  def run(*args, &block)
    DB.transaction(:rollback=>:always, :auto_savepoint=>true){super}
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
    organisation = Organisation.new
    assert_equal(organisation, false)
  end
end
```

When I run the test with `bin/rake` an error comes up:

```
Running via Spring preloader in process 18970
rake aborted!
NameError: uninitialized constant Test
/home/koshy/UbuntuHDD/Documents/RailsProjects/testing-sequel/test/models/organisation_test.rb:4:in `<main>'
-e:1:in `<main>'
Tasks: TOP => default => test
```

Not sure how to proceed from here. Would appreciate any insight into this issue.