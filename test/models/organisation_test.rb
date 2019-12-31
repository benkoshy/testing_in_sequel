require 'test_helper'
require 'sequel_test_case'

require 'fixture_dependencies/test_unit/sequel'

class OrganisationTest < FixtureDependencies::SequelTestCase
  def test_organisation_name
    organisation = Organisation.new
    assert_equal(organisation, false)
  end
end
