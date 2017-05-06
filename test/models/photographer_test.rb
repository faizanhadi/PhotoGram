require 'test_helper'

class PhotographerTest < ActiveSupport::TestCase
  
  def setup
    @p = Photographer.new(pname: "john", email: "john@example.com" )
  end
  
  test "photographer should be valid" do
    assert @p.valid?
  end
  
  
  test "photographer name should be present" do
    @p.pname =" "
    assert_not @p.valid?
  end
  
  test "name should not be too long" do
    @p.pname = "a" *41
    assert_not @p.valid?
  end
  
  test "name should not be too short" do
    @p.pname = "aa"
    assert_not @p.valid?
  end
  
  test "email should be present" do
    @p.email = " "
    assert_not @p.valid?
  end
  
  test "email should be within bounds" do
    @p.email = "a" * 101 + "@example.com"
    assert_not @p.valid?
  end
  
  test "email address should be unique" do
    dup_p = @p.dup
    dup_p.email = @p.email.upcase
    @p.save
    assert_not dup_p.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @p.email = va 
      assert @p.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject valid addresses" do
    invalid_address = %w[user@example,com user_at_ee.org user.name@example eee@i_am_.com foo@ee+aar.com]
    invalid_address.each do |ia|
      @p.email = ia
      assert_not @p.valid?, '#{va.inspect} should be valid'
    end
  end
  
  
end

