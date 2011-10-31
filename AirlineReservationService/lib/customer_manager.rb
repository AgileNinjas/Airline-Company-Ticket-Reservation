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


  def add_customer_xml(customer)
       file = File.new( "../xmls/customer.xml" )
       doc = REXML::Document.new file

       customer_el=Element.new "customer"
       id_el= customer_el.add_element "id"
       id_el.text=customer.id
       name_el= customer_el.add_element "name"
       name_el.text=customer.name
       passport_el= customer_el.add_element "passport"
       passport_el.text=customer.passport

       doc.root.insert_after(doc.elements["customer",customer],customer_el)
       File.open("../xmls/customer.xml", 'w') {|f| f.write(doc)}
     end




















  def get_customer_by_passport_number(passport_number)

  customers.each {|customer|
  if(customer.passport==passport_number)
      return customer
  end
  }



end

end


