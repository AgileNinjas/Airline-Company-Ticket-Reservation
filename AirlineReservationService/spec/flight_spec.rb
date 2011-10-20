require "rspec"
require "../lib/flight"

describe "Flight" do

  subject {Flight.new(1 ,"default" , 120 , "departure" ,"arrival",20,100,0,100,500, 200,"5",Time.now, Time.now)}
  
  it "flight should have an id which is a positive integer" do

    

    subject.id.should > 0
    subject.id.should be_a_kind_of(Integer)

  end

  it "flight should have a capacity which is a positive integer between 20 and 400" do

    

   (20..400).should include(subject.capacity)
    subject.capacity.should be_a_kind_of(Integer)

  end



   it "flight should have a first class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    

    subject.first_class_capacity.should >= 0
     subject.first_class_capacity.should be_a_kind_of(Integer)

   end

   it "flight should have a economic class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    

    subject.economic_class_capacity.should >= 0
    subject.economic_class_capacity.should be_a_kind_of(Integer)

   end

   it "flight should have a business class capacity which is an positive integer if it exists on the flight and 0 otherwise" do

    

    subject.business_class_capacity.should >= 0
    subject.business_class_capacity.should be_a_kind_of(Integer)

  end

   it "all seats of the flight should be either on economic , first class or business class" do

    
    (subject.economic_class_capacity + subject.first_class_capacity + subject.business_class_capacity).should == subject.capacity

   end

  it "flight should have a economic class price" do

     
     subject.economic_class_price.should >= 0

    end

  it "flight should have a first class price" do

       
       subject.first_class_price.should >= 0

  end

   it "flight should have a business class price" do

       
       subject.business_class_price.should >= 0

   end

    it "flight should have prices for classes in logic order" do

       
       (subject.economic_class_price..subject.first_class_price).should include subject.business_class_price

    end

    it "should have an business available seats attribute which should be equal to capacity at initialization" do
      subject.available_seats_business.should == subject.business_class_capacity
    end

  it "should have an economic available seats attribute which should be equal to capacity at initialization" do
      subject.available_seats_economic.should == subject.economic_class_capacity
  end


end