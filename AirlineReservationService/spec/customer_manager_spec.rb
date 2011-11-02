require "rspec"
require "rspec"
require "../lib/customer_manager.rb"
require "../lib/customer.rb"



describe "My behaviour" do

  subject {Customer_manager.new}

  it "should have an array of customers" do
      subject.customers.should be_an_instance_of(Array)

  end


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

    #it "should return customer1 when passport number is 54789" do
    #   subject.search_customer(54789)==[customer1]
    #end

  end
  end