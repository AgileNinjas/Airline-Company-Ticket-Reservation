require "rspec"
require "../lib/flight"

describe "Flight" do

  it "flight should have an id which is a positive integer" do

    flight = Flight.new
    flight.id.should > 0
    flight.id.kind_of?(1.class).should == true

  end

  it "flight should have a capacity which is a positive integer between 20 and 400" do

    flight = Flight.new

    flight.capacity.should >= 20
    flight.capacity.should <= 400

    flight.id.kind_of?(1.class).should == true

  end

end