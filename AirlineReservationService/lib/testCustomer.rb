require "../lib/customer_manager.rb"
require "../lib/customer.rb"


customer=Customer.new(7, "mike", 777)
object= Customer_manager.new
object.add_customer_xml(customer)
