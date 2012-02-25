require 'test_helper'

class ExhibitTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Exhibit.new.valid?
  end
end
