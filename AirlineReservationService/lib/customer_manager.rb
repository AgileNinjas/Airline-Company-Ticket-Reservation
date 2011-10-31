require "../lib/customer.rb"
require "rexml/document"
include REXML

class Customer_manager

  attr_accessor :customers

  def initialize
    @customers=[]
    get_all_customers
  end

  def add_customer(customer)
    @customers.push(customer)
  end

  def get_all_customers
      file = File.new( "../xmls/customer.xml" )
      doc = REXML::Document.new file


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

  return nil

  end


  def get_customer_details(passport)
        begin

     xml_customer_details="../xmls/customer.xml"

     xml_doc = Document.new File.new( xml_customer_details)

     customer_id=Integer(xml_doc.root.elements["id"].text)
     customer_name=xml_doc.root.elements["name"].text
     customer_passport=Integer(xml_doc.root.elements["passport"].text)

     return Customer.new(customer_id,customer_name,customer_passport)

    rescue
      return nil
    end
  end


end


