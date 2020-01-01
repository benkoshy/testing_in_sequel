require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase
  def test_organisation_name
    organisation = load(:organisation__one)
    assert_equal(organisation.name, "BadBoys")
  end
end
