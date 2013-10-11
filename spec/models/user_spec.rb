require 'spec_helper'

describe User do
  def new_user(attributes = {})
    attributes[:username] ||= 'bob'
    attributes[:email] ||= 'bob@gmail.com'
    attributes[:password] ||= 'bobspassword'
    attributes[:password_confirmation] ||= attributes[:password]
    User.new(attributes)
  end

  it "should be valid" do
    new_user.should be_valid
  end

  it "should require username" do
    new_user(:username => '').should have(1).error_on(:username)
  end

  it "should require password" do
    new_user(:password => '').should have(1).error_on(:password)
  end

  it "should require well formed email" do
    new_user(:email => 'bob@gmail@gmail.com').should have(1).error_on(:email)
  end

  it "should validate uniqueness of email" do
    new_user(:email => 'bob@gmail.com').save!
    new_user(:email => 'bob@gmail.com').should have(1).error_on(:email)
  end

  it "should not allow special characters in username" do
    new_user(:username => '@#$%^&*() ').should have(1).error_on(:username)
  end

  it "should validate uniqueness of username" do
    new_user(:username => 'bobsaget').save!
    new_user(:username => 'bobsaget').should have(1).error_on(:username)
  end

  it "should validate length of password to be >= 6" do
    new_user(:password => 'saget').should have(1).error_on(:password)
  end

  it "should require matching password confirmation" do
    new_user(:password_confirmation => 'ssaget').should have(1).error_on(:password)
  end

  it "should generate password hash and salt" do
    user = new_user
    user.save!
    user.password_hash.should_not be_nil
    user.password_salt.should_not be_nil
  end

  it "should authenticate by username" do
    user = new_user(:username => 'aaron', :password => 'iscool')
    user.save!
    User.authenticate('aaron', 'iscool').should == user
  end

  it "should not authenticate username not in database" do
    User.authenticate('blank', 'iscool').should be_nil
  end

  it "should not authenticate bad password" do
    new_user(:username => 'aaron', :password => 'iscool').save!
    User.authenticate('aaron', 'isnotcool').should be_nil
  end
end
end
