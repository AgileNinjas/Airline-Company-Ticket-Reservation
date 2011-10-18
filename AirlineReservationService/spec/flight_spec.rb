require "rspec"
require "../lib/flight"

describe "Flight" do

  it "flight should have an id which is a positive integer" do

    flight = Flight.new
    flight.id.should > 0
    flight.id.kind_of?(1.class).should == true

  end
end