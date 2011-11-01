require "../lib/customer.rb"
require "rexml/document"
require "customer"
include REXML

class Customer_manager

  attr_accessor :customers

  def initialize
    @customers=[]

  end

  #def add_customer(customer)
  #  @customers.push(customer)
  #end


  def get_all_customers(passport)
    file = File.new( "../xmls/customer.xml" )
    doc = REXML::Document.new file

    @customers=[]
    doc.elements.each("customer_details/customer") { |element|
    id = Integer(element.elements["id"].text)
    name = element.elements["name"].text
    customer_passport=Integer(element.elements["passport"].text)

    if (customer_passport==passport)
        @customers.push(id)
        @customers.push(name)
        @customers.push(customer_passport)
    return @customers
    end

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
     end





  #def get_customer_by_passport_number(passport_number)
  #
  #customers.each {|customer|
  #if(customer.passport==passport_number)
  #    return customer
  #end
  #}
  #
  #return nil
  #
  #end


  def get_customer_details(passport)
        begin

     xml_customer_details="../xmls/customer.xml"
     xml_doc = Document.new File.new( xml_customer_details)


  end


end


 end