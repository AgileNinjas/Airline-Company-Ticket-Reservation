require "rspec"
require "reservation"
require "customer"

describe "My behaviour" do



  it "should reservation includes a customer_id and a flight_id" do

    reservation = Reservation.new()

    reservation.customer_id.should be_a_kind_of(Integer)

  end


  #it "should " do
  #
  #
  #
  #end




end