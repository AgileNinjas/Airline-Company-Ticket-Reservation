require "../lib/reservation"
require "../lib/customer"
require "../lib/flight"

class Reservation
      attr_accessor :customer, :flight , :class_type , :confirmation_code

  def initialize (customer, flight, class_type="economic", code = "")
       @customer = customer
       @flight = flight
       @class_type = class_type

       if code == "" then
       # random string from : http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
       o =  [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten;
       string  =  (0..7).map{ o[rand(o.length)]  }.join;

       @confirmation_code = string
       else
         @confirmation_code = code
       end



  end





end

