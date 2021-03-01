require "test_helper"

class FacilityTest < ActiveSupport::TestCase
  test "Should successfully save facility" do
  	entry = Entry.new(name: "Galaxy", capacity: 10, conferencing: false, whiteboard: 2)
    assert entry.save
  end

  test "Should not save facility without name" do
  	entry = Entry.new(capacity: 10, conferencing: false, whiteboard: 2)
    assert_not entry.save
  end

  test "Should not save facility without capacity" do
  	entry = Entry.new(name: "Galaxy", conferencing: false, whiteboard: 2)
    assert_not entry.save
  end

  test "Should not save facility without whiteboard" do
  	entry = Entry.new(name: "Galaxy", capacity: 10, conferencing: false, whiteboard: -2)
    assert_not entry.save
  end
end
