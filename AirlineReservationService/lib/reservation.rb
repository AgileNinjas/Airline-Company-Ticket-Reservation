require "../lib/reservation"
require "../lib/customer"
require "../lib/flight"

class Reservation
      attr_accessor :customer, :flight , :class_type , :confirmation_code

  def initialize (customer, flight, class_type="economic")
       @customer = customer
       @flight = flight
       @class_type = class_type
       @confirmation_code = "code"
  end





end

