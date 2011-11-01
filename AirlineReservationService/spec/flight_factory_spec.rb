require "rspec"
require "../lib/flight_factory"
require "../lib/flight"

describe FlightFactory do

  subject {FlightFactory.new}

  it "FlightFactory should have new_flight that returns a Flight" do
     subject.get_flight(3).should be_an_instance_of(Flight)
  end

  it "should read the default name" do
     subject.get_flight(3).name.should =="Munich to Rome"
  end

  it "should read the default departure" do
     subject.get_flight(3).departure.should == "munich"
  end

  it "should read the default arrival" do
     subject.get_flight(3).arrival.should == "rome"
  end

  it "should read the default economic class capacity" do
     subject.get_flight(3).arrival.should == "rome"
  end

  it "should have a duration attribute" do
    subject.get_flight(3).duration.should == 5
  end

  it "should have an departure time" do
    subject.get_flight(3).departure_time.should == Time.utc(2011,11,20,18)
  end

  it "should have an arrival time" do
    subject.get_flight(3).arrival_time.should == Time.utc(2011,11,20,23)
  end
end