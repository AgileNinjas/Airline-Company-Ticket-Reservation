require "rspec"
require "../lib/flight_manager.rb"

require "../lib/flight.rb"
 require "../lib/query.rb"
require "../lib/route.rb"


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

  it "should have a search method with an argument of type of Query and it should return a list of results" do

     query =Query.new("manchester","london",12-10-2011,10-03-2011)
    subject.search(query)

  end

end