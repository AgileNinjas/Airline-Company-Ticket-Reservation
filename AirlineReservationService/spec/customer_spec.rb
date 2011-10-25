require "rspec"
require "../lib/customer.rb"

describe "My behaviour" do

  subject {Customer.new(544,"Mike",5675)}

  it "should have a customer name" do
    subject.name.should_not == nil
  end


  it "should have a customer passport" do
    subject.passport.should_not == nil
  end


  it "should have a customer id" do
    subject.id.should_not == nil
  end
end