require "rspec"
require "../lib/route"

describe "Route" do

  subject {Route.new}
  
  it "route should have an id which is a positive integer" do

    

    subject.id.should > 0
    subject.id.should be_a_kind_of(Integer)

  end

  it "route should have a capacity which is a positive integer between 20 and 400" do

    

   (20..400).should include(subject.capacity)
    subject.capacity.should be_a_kind_of(Integer)

  end

   it "route should have a price which is a positive number" do

    

    subject.price.should >= 0
    subject.price.should be_a_kind_of(Integer)

   end

   it "route should have a first class capacity which is an positive integer if it exists on the route and 0 otherwise" do

    

    subject.first_class_capacity.should >= 0
     subject.first_class_capacity.should be_a_kind_of(Integer)

   end

   it "route should have a economic class capacity which is an positive integer if it exists on the route and 0 otherwise" do

    

    subject.economic_class_capacity.should >= 0
    subject.economic_class_capacity.should be_a_kind_of(Integer)

   end

   it "route should have a business class capacity which is an positive integer if it exists on the route and 0 otherwise" do

    

    subject.business_class_capacity.should >= 0
    subject.business_class_capacity.should be_a_kind_of(Integer)

  end

   it "all seats of the route should be either on economic , first class or business class" do

    
    (subject.economic_class_capacity + subject.first_class_capacity + subject.business_class_capacity).should == subject.capacity

   end

  it "route should have a economic class price" do

     
     subject.economic_class_price.should >= 0

    end

  it "route should have a first class price" do

       
       subject.first_class_price.should >= 0

  end

   it "route should have a business class price" do

       
       subject.business_class_price.should >= 0

   end

    it "route should have prices for classes in logic order" do

       
       (subject.economic_class_price..subject.business_class_price).should include subject.first_class_price

    end

   it "route should have flights as an array" do

      subject.flights.should be_an_instance_of(Array)
   end

  it "should have an add method to flights array" do
    flights_no = subject.flights.length+1
    flight = mock('Flight')
    subject.add_spec flight
    subject.flights.length.should == flights_no
  end


end