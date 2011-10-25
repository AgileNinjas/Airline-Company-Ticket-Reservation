require "rspec"
require "reservation_manager.rb"

describe "Reservation Manager" do

  subject {ReservationManager.new}

   let(:customer) {mock('Customer')}
   let(:flight) {mock('Flight', :search_available_seats => true, :update_available_seats => true)}
   let(:full_flight) {mock ('Flight', :search_available_seats => false, :update_available_seats => true)}
   let(:flight11)  { Flight.new(1, "default1" , 100  , "manchester" , "london", 100 ,200 ,20,1000,2000,3000 ,16,Time.now ,Time.now) }

  it "should have a method named create_reservation that return reservation object" do
     subject.create_reservation(customer,flight).should be_an_instance_of(Reservation)
  end

   it "should have array Reservation that keeps all the reservations" do
     subject.reservations.should be_an_instance_of(Array)
   end

    it "should add the reservation in the array once it is created" do
     no_of_reservations = subject.reservations.length
     subject.create_reservation(customer, flight)
     subject.reservations.length.should == no_of_reservations+1
    end

    it "should return nil if there is no available seats in the flight" do
      subject.create_reservation(customer,full_flight,"economic").should be_nil
    end

    it "should decrease the number of the available seats once a reservation is created" do
      flight.should_receive (:update_available_seats)
      subject.create_reservation(customer,flight)
    end


end


  #customer.stub!(:id).and_return('customer_id')
  #  subject.customer.should == customer