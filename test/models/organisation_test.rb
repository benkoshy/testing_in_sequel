require 'test_helper'
require 'sequel_test_case'


class OrganisationTest < ActiveSupport::TestCase
  def test_organisation_name
    organisation = load(:organisation__one)
    assert_equal(organisation.name, "BadBoys")
  end
end
