require "rspec"
require "../lib/flight_factory"
require "../lib/flight"

describe FlightFactory do

  it "FlightFactory should have new_flight" do

     flight_factory= FlightFactory.new
     flight_factory.new_flight.should be_an_instance_of(Flight)
  end
end