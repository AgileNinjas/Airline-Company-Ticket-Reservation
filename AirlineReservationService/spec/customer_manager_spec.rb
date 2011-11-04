require "rspec"
require "../lib/customer_manager.rb"
require "../lib/customer.rb"


describe "Customer_manager" do

  subject {Customer_manager.new}

  it "should have an add method to add all customers to customer array" do
      customer = Customer.new(6,"name6",478907)
      subject.add_customer_xml(customer)
      subject.customers.should include(customer)

  end


  context "search for customers" do
    let(:index) {rand(10000)}
    let(:customer3) {Customer.new(3,"Name3",index)}
    before do
      subject.add_customer_xml(customer3)
    end


  it "should contain a search method and return a customer object" do
   subject.get_customer_by_passport_number(index).should==customer3

  end

end

end