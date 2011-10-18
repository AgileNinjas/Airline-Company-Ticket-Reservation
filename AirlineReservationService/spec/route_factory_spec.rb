require "rspec"
require "../lib/route_factory"
require "../lib/route"

describe RouteFactory do

  subject {RouteFactory.new}

  it "RouteFactory should have new_flight that returns a Flight" do

     subject.new_route.should be_an_instance_of(Route)

  end

  it "should read the default name" do

     subject.new_route.name.should =="Munich to Rome"

  end

  it "should read the default capacity" do

     subject.new_route.capacity.should == 250

  end
end