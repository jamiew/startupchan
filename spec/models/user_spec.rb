require 'spec_helper'

describe User do
  it "should work with email" do
    FactoryGirl.build(:user, :email => "rappers@internetofdeath.com").should be_valid
  end

  it "should fail without email" do
    FactoryGirl.build(:user, :email => nil).should_not be_valid
  end

  it "should fail with an invalid email" do
    ['bademail', 'bademail@example', 'bademail.com'].each do |email|
      FactoryGirl.build(:user, :email => email).should_not be_valid
    end
  end

  it "send a welcome email after create" do
    ActionMailer::Base.deliveries.count.should == 0
    FactoryGirl.create(:user, :email => "definitely@anewuser.com")
    ActionMailer::Base.deliveries.count.should == 1
  end
end
