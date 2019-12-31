require 'test_helper'
require 'sequel_test_case'

class OrganisationTest < SequelTestCase
  def test_organisation_name
    organisation = Organisation.new
    assert_equal(organisation, false)
  end
end
