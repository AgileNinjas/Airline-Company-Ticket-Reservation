require "rspec"
require "../lib/query.rb"


describe "Query" do

  it "should have not empty attributes: departure_city, arrival_city, start_date" do
    departure_city="london"
    arrival_city="manchester"
    start_date="12-10-2011"
    query=Query.new(departure_city,arrival_city,start_date)
    query.departure_city.should == "london"
    query.date.should == "12-10-2011"
    query.arrival_city.should == "manchester"
  end

end