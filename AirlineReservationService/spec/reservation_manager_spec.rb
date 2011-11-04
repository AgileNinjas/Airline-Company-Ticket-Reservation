require "rspec"
require "reservation_manager.rb"

describe "Reservation Manager" do

  subject {ReservationManager.new}

   let(:customer) {mock('Customer')}
   let(:flight) {Flight.new(2, "default2" , "manchester" , "london", 100 ,200 ,20,1000,2000,3000 ,16,Time.now ,Time.now,100 ,200 ,20) }
   let(:full_flight) {Flight.new(3, "default3" , "manchester" , "london", 100 ,200 ,20,1000,2000,3000 ,16,Time.now ,Time.now,0 ,0 ,0)}
   let(:flight11)  { Flight.new(1, "default1" , "manchester" , "london", 100 ,200 ,20,1000,2000,3000 ,16,Time.now ,Time.now,100 ,200 ,20) }


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

    it "should have a method get_reservation that returns an reservation when it is supplied with a confirmation code" do
      reservation = subject.create_reservation(customer,flight)
      subject.get_reservation(reservation.confirmation_code).should == reservation
    end

    it " get_reservation should return nil if the confirmation code doesn't exist" do
      reservation = subject.create_reservation(customer,flight)
      subject.get_reservation("a code").should == nil
    end

end
