require "rspec"
require "rspec"
require "../lib/customer_manager.rb"
require "../lib/customer.rb"


describe "My behaviour" do

  subject {Customer_manager.new}

  it "should have an array of customers" do
      subject.customers.should be_an_instance_of(Array)

  end


  it "should have a add method to add all customers to customer array" do
      customer=mock(Customer)
      subject.add_customer(customer)
      subject.customers.should include(customer)

  end

  context "search for customers" do
    let(:customer1) {Customer.new(1,"Name1",54789)}
    let(:customer2) {Customer.new(2,"Name2",78908)}


    before do
      subject.add_customer(customer1)
    end

  it "should contain a search method and return a customer object" do
   subject.get_customer_by_passport_number(54789).should==customer1

  end

    #it "should return customer1 when passport number is 54789" do
    #   subject.search_customer(54789)==[customer1]
    #end

  end
  end