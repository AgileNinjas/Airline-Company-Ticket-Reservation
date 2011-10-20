require "rspec"
require "../lib/flight_factory"
require "../lib/flight"

describe FlightFactory do

  subject {FlightFactory.new}

  it "FlightFactory should have new_flight that returns a Flight" do

     subject.get_flight.should be_an_instance_of(Flight)

  end

  it "should read the default name" do

     subject.get_flight.name.should =="Munich to Rome"

  end

  it "should read the default capacity" do

     subject.get_flight.capacity.should == 250

  end

  it "should read the default departure" do

     subject.get_flight.departure.should == "Munich"

  end

  it "should read the default arrival" do

     subject.get_flight.arrival.should == "Rome"

  end

  it "should read the default economic class capacity" do

     subject.get_flight.arrival.should == "Rome"

  end
end