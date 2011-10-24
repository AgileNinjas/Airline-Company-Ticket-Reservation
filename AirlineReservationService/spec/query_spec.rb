require "rspec"
require "../lib/query.rb"


describe "My behaviour" do

  it "should have not empty attributes: departure_city, arrival_city, start_date" do
    departure_city="london"
    arrival_city="manchester"
    start_date=12-10-2011
    end_date=16-10-2011
    query=Query.new(departure_city,arrival_city,start_date)
    departure_city.should_not be_nil
    start_date.should_not be_nil
    arrival_city.should_not be_nil
  end
end