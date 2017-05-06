require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
   def setup
     @p = Photographer.create(pname: "bob", email: "bob@example.com")
     @photo = @p.photos.build(name: "Sunset", caption: "Sunset in Hawaii")
   end
   
   
   test "photo should be valid" do
     assert @photo.valid?
   end
  
  test "photographer id should be present" do
    @photo.photographer_id = nil
    assert_not @photo.valid?
  end
  
  test "name should be present" do
    @photo.name =" "
    assert_not @photo.valid?
  end
  
  
  test "name length should not be too long" do
    @photo.name = "a" * 101
    assert_not @photo.valid?
  end
  
  
  test "name length should not be too short" do
    @photo.name = "aaaa"
    assert_not @photo.valid?
  end
  
  
  test "caption should be present" do
    @photo.name = " "
    assert_not @photo.valid?
  end
  
  
  test " caption length shoulh not be too long" do
    @photo.caption = "a" * 151
    assert_not @photo.valid?
  end
  
  
  test "caption length should not me too short" do
    @photo.caption = "a" * 9
    assert_not @photo.valid?
  end
  
  
end