require "rspec"
require "../lib/reservation.rb"



describe "My behaviour" do


  let(:customer) {mock('Customer')}
  let(:flight) {mock('Flight')}

  subject {Reservation.new(customer, flight)}

  it "should have a reservation that includes a customer" do
    customer.stub!(:id).and_return('customer_id')
    subject.customer.should == customer
  end


  it "should have a reservation that includes a flight" do
      flight.stub!(:id).and_return('flight_id')
      subject.flight.should == flight
    end
end