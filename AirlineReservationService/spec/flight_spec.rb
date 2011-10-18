require "rspec"
require "../lib/flight"

describe "Flight" do

  it "flight should have an id which is a positive integer" do

    flight = Flight.new

    flight.id.should > 0

    flight.id.should be_a_kind_of(Integer)

  end

  it "flight should have a capacity which is a positive integer between 20 and 400" do

    flight = Flight.new

   (20..400).should include(flight.capacity)

    flight.capacity.should be_a_kind_of(Integer)

  end

   it "flight should have a price which is a positive number" do

    flight = Flight.new

    flight.price.should >= 0

    flight.price.should be_a_kind_of(Integer)

   end

   it "flight should have a first class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    flight = Flight.new

    flight.first_class_capacity.should >= 0

    flight.first_class_capacity.should be_a_kind_of(Integer)

   end

   it "flight should have a economic class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    flight = Flight.new

    flight.economic_class_capacity.should >= 0

    flight.economic_class_capacity.should be_a_kind_of(Integer)

   end

   it "flight should have a business class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    flight = Flight.new

    flight.business_class_capacity.should >= 0

    flight.business_class_capacity.should be_a_kind_of(Integer)

  end

   it "all seats of the flight should be either on economic , first class or business class" do

    flight = Flight.new

    (flight.economic_class_capacity + flight.first_class_capacity + flight.business_class_capacity).should == flight.capacity

   end

  it "flight should have a economic class price" do

     flight = Flight.new
     flight.economic_class_price.should >= 0

    end

  it "flight should have a first class price" do

       flight = Flight.new
       flight.first_class_price.should >= 0

  end

   it "flight should have a business class price" do

       flight = Flight.new
       flight.business_class_price.should >= 0

    end



end