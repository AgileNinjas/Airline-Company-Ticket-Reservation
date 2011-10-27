require "reservation.rb"

class ReservationManager

  attr_accessor :reservations

  def initialize
    @reservations = []
  end

  def create_reservation (customer, flight , class_type="economic")
    if (flight.search_available_seats(class_type,1))
        reservation = Reservation.new(customer,flight,class_type)
        reservations.push(reservation)
        flight.update_available_seats(reservation)
        return reservation
    else
        return nil
    end

  end



end