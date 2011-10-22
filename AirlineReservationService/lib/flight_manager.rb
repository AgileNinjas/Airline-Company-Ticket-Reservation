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


     XPath.each( element, "//arrival_city") do |element2|


     if  element2.text == "amsterdam"
       puts element["departure_city"].text
     end

     end

  #XPath.each( doc, "//flight/arrival_city") do |element|
  #      puts element
  #if XPath.match(element)== query
  #   puts query.arrival_city
  #  puts "true"
  #end



  end

  end

  end

fls=Flight_manager.new
    q=Query.new("london","manchester",2011-01-01,2011-01-01)
       fls.search(q)

