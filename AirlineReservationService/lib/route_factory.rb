require "route"
require "rexml/document"

include REXML

class RouteFactory

  def new_route  route_id = 1

     xml_name_for_flight="../xmls/flight_"+route_id.to_s+".xml"
     xml_doc = Document.new File.new(xml_name_for_flight)

     route_name=xml_doc.root.elements["name"].text
     route_capacity=Integer(xml_doc.root.elements["capacity"].text)
     route_departure=xml_doc.root.elements["departure"].text
     route_arrival=xml_doc.root.elements["arrival"].text

     Route.new(route_id,route_name,route_capacity,route_departure,route_arrival)

  end
end