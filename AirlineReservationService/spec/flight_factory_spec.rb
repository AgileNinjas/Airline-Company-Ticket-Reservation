require "rspec"
require "../lib/flight_factory"
require "../lib/flight"

describe "Flight_factory" do

  subject {FlightFactory.new}

  it "should read the default name" do
     subject.get_flight(3).name.should =="madrid to lisbon"
  end

  it "should read the default departure" do
     subject.get_flight(3).departure.should == "madrid"
  end

  it "should read the default arrival" do
     subject.get_flight(3).arrival.should == "lisbon"
  end

  it "should read the default economic class capacity" do
     subject.get_flight(3).economic_class_capacity.should == 100
  end

  it "should have a duration attribute" do
    subject.get_flight(3).duration.should == 2
  end

  it "should have an departure time" do
    subject.get_flight(3).departure_time.should == Time.utc(2011,11,12)
  end

  it "should have an arrival time" do
    subject.get_flight(3).arrival_time.should == Time.utc(2011,11,12,12)
  end

end