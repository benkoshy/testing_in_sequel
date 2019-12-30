# Steps to reproduce

I am trying to get a 'hello world' sample test working with sequel and minitest.

* I have used the sequest_rails gem to get started.

* I have created a `test/sequel_test_case.rb` file which contains:

```ruby
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
    assert_equal(true, false)
  end
end

```

# The Error Message

When I run `bin/rake test test/models/organisation_test.rb` then there are some problems. I"m getting the following error:

`Connection reset by peer (DRb::DRbConnError)`

`/home/koshy/.rbenv/versions/2.6.5/lib/ruby/2.6.0/drb/drb.rb:574:in `read': Connection reset by peer (DRb::DRbConnError)`


Am unsure how to fix this, but was wanting a simple hello world example of a test up and running using sequel. It's probably ludicrously simple for those somewhat knowledgeable, hence am seeking a pointer.

Thank you for reading!

Ben
