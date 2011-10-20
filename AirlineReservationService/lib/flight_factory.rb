require "flight"
require 'time'
require "rexml/document"

include REXML

class FlightFactory

  def get_flight  flight_id = 1
    begin
     xml_name_for_flight="../xmls/flight_"+flight_id.to_s+".xml"
     xml_doc = Document.new File.new(xml_name_for_flight)

     flight_name=xml_doc.root.elements["name"].text
     flight_capacity = Integer(xml_doc.root.elements["capacity"].text)
     flight_departure = xml_doc.root.elements["departure"].text
     flight_arrival = xml_doc.root.elements["arrival"].text
     #flight_economic_price =  xml_doc.root.elements["economic_price"].text
     flight_duration = xml_doc.root.elements["duration"].text

     flight_departure_time = Time.parse(xml_doc.root.elements["departure_time"].text)
     flight_arrival_time = Time.parse(xml_doc.root.elements["arrival_time"].text)
     first_class_capacity  = Time.parse(xml_doc.root.elements["first_class_capacity"].text)
     economic_class_capacity  = xml_doc.root.elements["economic_class_capacity"].text
     business_class_capacity  = xml_doc.root.elements["business_class_capacity"].text
     economic_class_price  = xml_doc.root.elements["economic_class_price"].text
     first_class_price  = xml_doc.root.elements["first_class_price"].text
     business_class_price  = xml_doc.root.elements["business_class_price"].text

                             #id, name , capacity , departure , arrival, first_class_capacity ,economic_class_capacity ,business_class_capacity,economic_class_price,first_class_price,business_class_price , duration , departure_time , arrival_time)
     return Flight.new(flight_id,flight_name,flight_capacity,flight_departure,flight_arrival,first_class_capacity,economic_class_capacity,business_class_capacity,economic_class_price,first_class_price,business_class_price,flight_duration,flight_departure_time,flight_arrival_time)

    rescue
      return nil
    end
  end
end


