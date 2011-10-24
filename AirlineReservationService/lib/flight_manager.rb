require "../lib/flight.rb"
require "rexml/document"
require "../lib/query"
require "../lib/flight_factory"
include REXML  # so that we don't have to prefix everything with REXML::...


class Flight_manager

  attr_accessor :flights , :flight_ids

  def initialize
    @flights=[]
    @flight_ids=[]
    file = File.new( "../xmls/schedule.xml" )
    doc = REXML::Document.new file

    get_schedule

    XPath.each( doc, "//flight") do |element|
         @flight_ids.push(element.elements["id"].text)
     end
  end

  def add_flight(flight)
    @flights.push(flight)
  end

  def get_schedule
    file = File.new( "../xmls/schedule.xml" )
    doc = REXML::Document.new file

    flight_factory = FlightFactory.new
    doc.elements.each("schedule/flight") { |element|
      flight_id = element.elements["id"].text
      add_flight(flight_factory.get_flight(flight_id ))
    }
  end

  def search(query)

  flights_found = []

   start_search_date = query.date - 3*3600*24
  end_search_date = query.date + 3*3600*24

  flights.each {|flight|

    if (flight.arrival == query.arrival_city) and (flight.departure == query.departure_city) and ((start_search_date <=> flight.departure_time) == -1)  and ((end_search_date <=> flight.departure_time) == 1)
            flights_found.push(flight)
    end
  }

   flights_found.sort! {|x,y| x.compare(y)}

   return flights_found
  end



  end




