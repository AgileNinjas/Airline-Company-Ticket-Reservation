require "../lib/flight_factory"
require "../lib/flight"
require "../lib/query"
require "../lib/flight_manager"

class Main

  def get_search_details
    puts "Please enter the following information"
    puts "Please enter the Departure City: "
    departure = gets.downcase
    puts "Please enter the Arrival City: "
    arrival = gets.downcase
    puts "Please enter the Date dd-mm-year: "
    date = Time.parse(gets)

    query = Query.new(departure, arrival, date)
  end

  def show_search_results(query)
    flight_manager = Flight_manager.new

    results = flight_manager.search(query)

    if results.length == 0
      puts "There no flights corresponding for your search parameters"
    else
      puts "Results of your search ordered by price and duration are:"
      results.each {|flight| puts "Flight: " +flight.id.to_s+" Economic price: " +flight.economic_class_price.to_s+ " Duration: "+ flight.duration.to_s}

    end
  end



  def get_flight_id
    puts "Please enter the flight id:"
    flight_id = Integer(gets)
  end

  def show_details  flight_id
    flight_factory=FlightFactory.new

    flight= flight_factory.get_flight(flight_id)
    if (flight == nil)
      puts "Flight id doesn't exists"
    else
    puts "Flight name is: "+flight.name
    puts "Departure is: "+flight.departure
    puts "Arrival is: "+flight.arrival
    puts "Departure time is: "+flight.departure_time.to_s
    puts "Arrival time is: "+flight.arrival_time.to_s
    puts "Flight duration is: "+flight.duration
    puts "Economic class is: "+flight.economic_class_price.to_s
    puts "Business class is: "+flight.business_class_price.to_s
    puts "First class is: "+flight.first_class_price.to_s
    end
  end

  def show_interface
    id = get_flight_id
    show_details id
  end

  def show_search_interface
    query = get_search_details
    show_search_results query
  end

end