require "../lib/customer_manager.rb"
require "../lib/customer.rb"


customer=Customer.new(8, "fcgdfgfgdd", 454)
object= Customer_manager.new
object.add_customer_xml(customer)
