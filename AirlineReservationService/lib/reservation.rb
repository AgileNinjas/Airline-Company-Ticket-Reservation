require "../lib/reservation"
require "../lib/customer"
require "../lib/flight"

class Reservation
      attr_accessor :customer, :flight

  def initialize (customer, flight)
       @customer = customer
       @flight = flight

  end





end

