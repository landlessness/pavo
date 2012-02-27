require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Brand.new.valid?
  end
end
