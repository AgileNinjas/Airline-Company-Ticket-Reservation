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

    #get_schedule

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
      @flights=[]
    flight_factory = FlightFactory.new
    doc.elements.each("schedule/flight") { |element|
      flight_id = Integer(element.elements["id"].text)
      add_flight(flight_factory.get_flight(flight_id ))
    }
  end

  def search(query)

  flights_found = []

   start_search_date = query.date - 3*3600*24
  end_search_date = query.date + 3*3600*24

  flights.each {|flight|

    if (flight.arrival == query.arrival_city.downcase) and (flight.departure == query.departure_city.downcase) and ((start_search_date <=> flight.departure_time) == -1)  and ((end_search_date <=> flight.departure_time) == 1)
            flights_found.push(flight)
    end
  }

   flights_found.sort! {|x,y| x.compare(y)}

   return flights_found
  end


  def create_flight(flight)
     add_flight_xml(flight)
     add_schedule(flight)
  end
    def add_flight_xml (flight)
       doc = Document.new "<flight></flight>"

    id_el=Element.new "id"
    id_el.text=flight.id
    doc.root[0]=id_el

    name_el=Element.new "name"
    name_el.text=flight.name
    doc.root[1]=name_el

     capacity_el=Element.new "capacity"
    capacity_el.text=flight.capacity
    doc.root[2]=capacity_el

     departure_el=Element.new "departure"
    departure_el.text=flight.departure
    doc.root[3]=departure_el

     arrival_el=Element.new "arrival"
    arrival_el.text=flight.arrival
    doc.root[4]=arrival_el

     first_class_capacity_el=Element.new "first_class_capacity"
    first_class_capacity_el.text=flight.first_class_capacity
    doc.root[5]=first_class_capacity_el

     economic_class_capacity_el=Element.new "economic_class_capacity"
    economic_class_capacity_el.text=flight.economic_class_capacity
    doc.root[6]=economic_class_capacity_el

     business_class_capacity_el=Element.new "business_class_capacity"
    business_class_capacity_el.text=flight.business_class_capacity
    doc.root[7]=business_class_capacity_el



     first_class_price_el=Element.new "first_class_price"
    first_class_price_el.text=flight.first_class_price
    doc.root[8]=first_class_price_el

     economic_class_price_el=Element.new "economic_class_price"
    economic_class_price_el.text=flight.economic_class_price
    doc.root[9]=economic_class_price_el

     business_class_price_el=Element.new "business_class_price"
    business_class_price_el.text=flight.business_class_price
    doc.root[10]=business_class_price_el

     duration_el=Element.new "duration"
    duration_el.text=flight.duration
    doc.root[11]=duration_el

     arrival_time_el=Element.new "arrival_time"
    arrival_time_el.text=flight.arrival_time
    doc.root[12]=arrival_time_el

    departure_time_el=Element.new "departure_time"
    departure_time_el.text=flight.departure_time
    doc.root[13]=departure_time_el

         first_class_availability_el=Element.new "first_class_availability"
         first_class_availability_el.text=flight.available_seats_first_class
         doc.root[14]=first_class_availability_el

          economic_class_capacity_el=Element.new "economic_class_availability"
         economic_class_capacity_el.text=flight.available_seats_economic
         doc.root[15]=economic_class_capacity_el

          business_class_capacity_el=Element.new "business_class_availability"
         business_class_capacity_el.text=flight.available_seats_business
         doc.root[16]=business_class_capacity_el

    File.open("../xmls/" + "flight_" + flight.id.to_s + ".xml", 'w') {|f| f.write(doc)}
    end

  def route_exist(query)

     route_status = false


     flights.each {|flight|

       if (flight.arrival == query.arrival_city.downcase) and (flight.departure == query.departure_city.downcase)
               route_status = true
       end
     }


      return route_status
     end


  def add_schedule(flight)
   file = File.new( "../xmls/schedule.xml" )
    doc = REXML::Document.new file
    flight_el=Element.new "flight"
    id_el= flight_el.add_element "id"
    id_el.text=flight.id
   doc.root.insert_after(doc.elements["flight",flight.id],flight_el)
   File.open("../xmls/schedule.xml", 'w') {|f| f.write(doc)}

  end

  def create_id
    get_schedule
    if flights.length == 0
       1
    else
       flights[flights.length-1].id + 1
    end
  end

  end




