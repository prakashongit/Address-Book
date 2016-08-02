require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "the truth" do
    address = Address.new
    assert_not address.save
  end
end
