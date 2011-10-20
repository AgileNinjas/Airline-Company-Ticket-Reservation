require "flight"
require "rexml/document"

include REXML

class FlightFactory

  def get_flight  flight_id = 1

     xml_name_for_flight="../xmls/flight_"+flight_id.to_s+".xml"
     xml_doc = Document.new File.new(xml_name_for_flight)

     flight_name=xml_doc.root.elements["name"].text
     flight_capacity=Integer(xml_doc.root.elements["capacity"].text)
     flight_departure=xml_doc.root.elements["departure"].text
     flight_arrival=xml_doc.root.elements["arrival"].text

     Flight.new(flight_id,flight_name,flight_capacity,flight_departure,flight_arrival)

  end
end