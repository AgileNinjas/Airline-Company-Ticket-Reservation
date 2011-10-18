require "rspec"
require "../lib/flight_manager.rb"

describe "My behaviour" do

  subject {Flight_manager.new}
  it "should have an array of flights" do

    #To change this template use File | Settings | File Templates.
  subject.flights.should be_an_instance_of(Array)
  end
end