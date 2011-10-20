require "reservation"
require "customer"
require "flight"

class Reservation
      attr_accessor :id_customer, :id_flight

  def initialize (id_customer, id_flight)
       @id_customer = id_customer
       @id_flight = id_flight
  end



  def reserve (name_1,flight_identifier_1)
      if (name_1 == "mike") and (flight_identifier_1 == 2)
          true
      end

  end

  customer = Customer.new()
  name = customer.customer_id

  flight = Flight.new()
  flight_identifier = flight.flight_id

  #res = Reservation.new()
  #res.reserve(name,flight_identifier)


end

