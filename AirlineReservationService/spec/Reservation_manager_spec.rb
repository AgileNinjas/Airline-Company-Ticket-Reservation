require "rspec"
require "reservation"

describe "My behaviour" do

  it "should max economic seats equal to 180" do
    reservation = FlightReservation.new()
    reservation.max_economic_counter.should == 180.0
  end


  it "should max business seats equal to 20" do
    reservation = FlightReservation.new()
    reservation.max_business_counter.should == 20.0
  end


  it "should economic class seats availability greater than zero" do
    reservation = FlightReservation.new
    reservation.search_available_seats("economic",19.0).should == true

  end


  it "should business class seats availability greater than zero" do
      reservation = FlightReservation.new
      reservation.search_available_seats("business",5).should == true

    end




end