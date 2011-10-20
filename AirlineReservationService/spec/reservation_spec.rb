require "rspec"
require "reservation"
require "customer"
require "flight"

describe "My behaviour" do


  it "should reservation includes a customer_id and a flight_id" do
    customer = Customer.new()
    customer.customer_id.should == 344

    flight = Flight.new()
    flight.flight_id.should == 2
  end




end