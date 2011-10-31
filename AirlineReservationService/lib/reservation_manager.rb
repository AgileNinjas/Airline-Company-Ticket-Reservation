require "reservation.rb"
require "flight_manager"

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
        flight_manager = Flight_manager.new
        flight_manager.add_flight_xml(flight)
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
    file = File.new( "../xmls/reservations.xml" )
    doc = REXML::Document.new file

    @reservations=[]
    doc.elements.each("reservations/reservation") { |element|

        customer_id = element.elements["customer_passport"].text



        customer_id = element.elements["code"].text
        customer_id = element.elements["flight_id"].text
        customer_id = element.elements["class_type"].text



    }

  end


end