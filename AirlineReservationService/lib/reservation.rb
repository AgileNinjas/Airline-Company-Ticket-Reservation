require "reservation"
require "customer"
require "flight"

class Reservation
      attr_accessor :id_customer


   def initialize()

   end


   def getCustomer(customer)
      customer = Customer.new()
      @id_customer.id_customer()

   end






end