require "rspec"
require "../lib/flight"

describe "Flight" do

  it "flight should have an id which is a positive integer" do

    flight = Flight.new

    flight.id.should > 0

    flight.id.kind_of?(Integer).should == true

  end

  it "flight should have a capacity which is a positive integer between 20 and 400" do

    flight = Flight.new

    flight.capacity.should >= 20
    flight.capacity.should <= 400

    flight.capacity.kind_of?(Integer).should == true

  end

   it "flight should have a price which is a positive number" do

    flight = Flight.new

    flight.price.should >= 0

    flight.price.kind_of?(Numeric).should == true

   end

   it "flight should have a first class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    flight = Flight.new

    flight.first_class_capacity.should >= 0

    flight.first_class_capacity.kind_of?(Integer).should == true

   end

   it "flight should have a economic class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    flight = Flight.new

    flight.economic_class_capacity.should >= 0

    flight.economic_class_capacity.kind_of?(Integer).should == true

   end

   it "all seats of the flight should be either on economic or first class" do

    flight = Flight.new

    (flight.economic_class_capacity + flight.first_class_capacity).should == flight.capacity

  end

end