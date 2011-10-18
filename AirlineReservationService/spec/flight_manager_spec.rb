require "rspec"
require "../lib/flight_manager.rb"
require "../lib/flight.rb"

describe "My behaviour" do

  subject {Flight_manager.new}
  it "should have an array of flight named flights" do

    subject.flights.should be_an_instance_of(Array)
   end

  it "should have an add method which will add flight objects to flights array"  do
      flight=mock(Flight)
      subject.add_flight(flight)
    subject.flights.should include(flight)

  end

  it "should have a search method with an argument of type of Query " do
    query = mock('Query')
    subject.search(query)
  end

end