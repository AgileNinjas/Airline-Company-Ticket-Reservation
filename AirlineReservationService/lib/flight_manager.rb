require "../lib/flight.rb"
require "rexml/document"
require "../lib/query"
include REXML  # so that we don't have to prefix everything with REXML::...

class Flight_manager
  attr_accessor :flights
        def initialize
          @flights=[]
        end
  
  def add_flight(flight)
    @flights.push(flight)
  end
  def search(query)
  file = File.new( "../../XMLSchema/TestSchedule.xml" )
  doc = REXML::Document.new file


  XPath.each( doc, "//flight") do |element|
   if XPath.match(element,"//id")== query.arrival_city
     puts "yes"
   end
  end


  end

end

fls=Flight_manager.new
    q=Query.new("uyu","hjhg",12-11-2010,11-10-2011)
         fls.search(q)