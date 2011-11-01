require "reservation.rb"
require "flight_manager"
require "customer_manager"
require "flight_factory"

class ReservationManager

  attr_accessor :reservations

  def initialize
    @reservations = []
    # refactor
    puts "init reservation manager"
   get_all_reservations()
  end

  def create_reservation (customer, flight , class_type="economic" , code ="")
    flight_manager = Flight_manager.new
    if (flight.search_available_seats(class_type,1))
        reservation = Reservation.new(customer,flight,class_type,code)
        reservations.push(reservation)
        flight.update_available_seats(reservation)
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
    customer_passport = element.elements["customer_passport"].text
    code = element.elements["code"].text
    flight_id = element.elements["flight_id"].text
    class_type = element.elements["class_type"].text

    customer_manager = Customer_manager.new
    customer = customer_manager.get_customer_by_passport_number(customer_passport)

        flight = FlightFactory.new.get_flight(flight_id)

        create_reservation(customer,flight,class_type,code)
       # reservation =  create_reservation ()

    }

  end

  def update_reservation_xml ()
       doc = Document.new "<reservations></reservations>"
    index = 0;
        @reservations.each { |reservation|

          reservation_el =Element.new "reservation"
    customer_passport_el=Element.new "customer_passport"
    customer_passport_el.text=reservation.customer.passport
    reservation_el[0]=customer_passport_el

    code_el=Element.new "code"
    code_el.text=reservation.confirmation_code
    reservation_el[1]=code_el

    flight_id_el=Element.new "flight_id"
   flight_id_el.text=reservation.flight.id
    reservation_el[2]=flight_id_el

    class_type_el=Element.new "class_type"
   class_type_el.text=reservation.class_type
    reservation_el[3]=class_type_el

    doc.root[index] = reservation_el
    index = index +1

  }

    File.open("../xmls/" + "reservations.xml", 'w') {|f| f.write(doc)}
    end

  def add_new_reservation(customer, flight , class_type="economic")
     reservation=  create_reservation(customer,flight,class_type)
       update_reservation_xml()
           return reservation
  end

end