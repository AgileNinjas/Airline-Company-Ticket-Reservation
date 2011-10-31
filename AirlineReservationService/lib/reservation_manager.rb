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

  def get_reservation confirmation_code
    reservations.each {|reservation|
        if (reservation.confirmation_code==confirmation_code)
          return reservation
        end
    }
    return nil
  end

  def get_all_reservations
    file = File.new( "../xmls/reservation.xml" )
    doc = REXML::Document.new file

    @reservations=[]
    doc.elements.each("reservations/reservation") { |element|

        customer_id = element.elements["customer_passport"].text
        #reservation =  create_reservation()

    }

  end


end