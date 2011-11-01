require "../lib/customer.rb"
require "rexml/document"
require "customer"
include REXML

class Customer_manager

  attr_accessor :customers

  def initialize
    @customers=[]
    get_all_customers()
  end


  #def add_customer(customer)
  #@customer.push(customer)
  #end


 def get_customer_by_passport_number(passport)
    @customers.each {|customer|

      if (customer.passport==passport) then
        return customer
      end
      }
      return nil
 end


  def get_all_customers
    file = File.new( "../xmls/customer.xml" )
    doc = REXML::Document.new file

    @customers=[]
    doc.elements.each("customer_details/customer") { |element|
    id = Integer(element.elements["id"].text)
    name = element.elements["name"].text
    customer_passport=Integer(element.elements["passport"].text)

    customer = Customer.new(id,name,customer_passport)
    @customers.push(customer)

    }

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
      @customers.push(customer)
     end


  def create__customer_id

    if customers.length == 0
       return 1
    else
       return customers[customers.length-1].id + 1
    end
  end

end

