require "test_helper"

class TimeslotTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    entry = Entry.new(time: "0900 - 1000")
    assert entry.save
    assert true
  end
end
