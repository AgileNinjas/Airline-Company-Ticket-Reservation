require "rspec"
require "../lib/flight_manager.rb"
require "../lib/flight.rb"
require "../lib/query.rb"
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

  context "searching for flights" do
     let(:flight1)  { Flight.new(1, "default1" , 100  , "manchester" , "london", 100 ,200 ,20,1000,2000,3000 ,16,Time.now ,Time.now, 100 ,200 ,20) }
     let(:flight2)  { Flight.new(2, "default2" , 100  , "paris" , "london", 100 ,200 ,20,1000,2000,3000 ,15,Time.now ,Time.now, 100 ,200 ,20)  }
     let(:flight3)  { Flight.new(3, "default3" , 100  , "munich" , "london", 100 ,200 ,20,1000,2000,3000 ,15,Time.now ,Time.now, 100 ,200 ,20)  }
     let(:flight4)  { Flight.new(4, "default4" , 100  , "manchester" , "london", 100 ,200 ,20,1000,2000,3000 ,15,Time.now ,Time.now, 100 ,200 ,20) }
     let(:flight5)  { Flight.new(5, "default5" , 100  , "manchester" , "london", 100 ,200 ,20,1000,2000,3000 ,15,Time.parse("20-11-2011 23:00") ,Time.now, 100 ,200 ,20) }

    before do
      subject.add_flight(flight1)
      subject.add_flight(flight2)
      subject.add_flight(flight3)
      subject.add_flight(flight4)
      subject.add_flight(flight5)
    end

    it "should have a search method with an argument of type of Query and it should return a list of results" do
       query =Query.new("manchester","london",Time.now)
       subject.search(query).should be_instance_of(Array)
    end

    it "should return more than a flight id if there are more than one matches" do
      query = Query.new("manchester","london",Time.now)
      result = subject.search(query)
      if (result.length > 0)
        result.permutation.should include [flight1,flight4]
      end
    end

    it "should return flight1" do
      query = Query.new("manchester","london",Time.now)
      result = subject.search(query)
      result[0].should == flight4
    end


    it "should return flight5 when search date is 20-11-2011 23:00 " do
       query = Query.new("manchester","london",Time.parse("20-11-2011 23:00"))
       subject.search(query).should == [flight5]
    end

    it "should return flight id 1 if the departure city is london and arrival is manchester" do
      query =  Query.new("paris","london",Time.now)
      subject.search(query).should == [flight2]
    end

  end

  #it "should have 10 flight ids" do
  #   subject.flights.length.should == 10
  #end

   it "should be able to add new flight"do
      my_subject  =Flight_manager.new
      flight=Flight.new(my_subject.create_id, "default1" , 100  , "sari" , "london", 100 ,200 ,20,1000,2000,3000 ,16,Time.parse("20-11-2011 17:00") ,Time.parse("20-11-2011 23:00"), 100 ,200 ,20)
      my_subject.create_flight(flight)
      query =  Query.new("sari","london",Time.parse("20-11-2011 17:00"))
      my_subject.get_schedule
      new_object=my_subject.search(query)
      new_object[new_object.length-1].id.should ==  flight.id
   end

  it "should create new ID for a new flight which is lastID + 1"do
      my_subject  =Flight_manager.new
      flight=Flight.new(my_subject.create_id, "default1" , 100  , "shiraz" , "london", 100 ,200 ,20,1000,2000,3000 ,16,Time.parse("20-11-2011 17:00") ,Time.parse("20-11-2011 23:00"), 100 ,200 ,20)
      my_subject.create_flight(flight)
      new_id= my_subject.create_id
      new_id.should == flight.id + 1
  end
end