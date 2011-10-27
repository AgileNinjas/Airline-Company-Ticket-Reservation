require "../lib/customer.rb"
require "rexml/document"
include REXML

class Customer_manager

  attr_accessor :customers

  def initialize
    @customers=[]
  end

  def add_customer(customer)
    @customers.push(customer)

  end

def get_customer_by_passport_number(passport_number)

  customers.each {|customer|
  if(customer.passport==passport_number)
    puts "hi"
    return customer
  end
  }
end

end


