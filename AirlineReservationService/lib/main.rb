require "../lib/flight_factory"
require "../lib/flight"
require "../lib/query"
require "../lib/flight_manager"

class Main

  def get_search_details
    puts "Please enter the following information"
    puts "--------------------------------------"
    puts "Please enter the Departure City: "
    departure = gets.chomp.downcase
    puts "Please enter the Arrival City: "
    arrival = gets.chomp.downcase
    puts "Please enter the Departure Date dd-mm-year: "
    date = Time.parse(gets.chomp)

    query = Query.new(departure, arrival, date)

    return query
  end

  def show_search_results(query)
    flight_manager = Flight_manager.new

    results = flight_manager.search(query)


    if results.length == 0
       if flight_manager.route_exist(query) == true
        puts "There is no flight corresponding to your search parameters, but the searched route exist"

       else
         puts "There is no flight corresponding to your search parameters and the searched route does not exist"
       end


    else
      puts "Results to your search ordered by price and duration are:"
      puts "---------------------------------------------------------"
      results.each {|flight| puts "Flight: " +flight.id.to_s
      puts "Economic price: " +flight.economic_class_price.to_s  + " pounds"
      puts "Duration: "+ flight.duration.to_s  + " hours"
      puts "Departure date: "+flight.departure_time.to_s
      puts "---------------"}

    end
  end



  def get_flight_id
    puts "*******  Search a flight ********"
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
    puts "Flight duration is: "+flight.duration + " hours"
    puts "Economic class price is: "+flight.economic_class_price.to_s + " pounds"
    puts "Business class price is: "+flight.business_class_price.to_s + " pounds"
    puts "First class price is: "+flight.first_class_price.to_s + " pounds"
    end
  end


  def show_flight_details
    id = get_flight_id
    show_details id
  end


  def show_search_interface
    query = get_search_details
    puts
    show_search_results query
  end

  def show_main_menu
    puts
    puts "***********************************"
    puts "** Select from the menu below :  **"
    puts "** 1.Search for a flight         **"
    puts "** 2.Show flight details         **"
    puts "** 3.Exit                        **"
    puts "***********************************"
    puts
    action=Integer(gets)
  end

  def show_interface
    while 1
    action_id=show_main_menu()
    case action_id
      when 1
        then show_search_interface
      when 2
        then show_flight_details
      when 3
        then break
    end

    end


  end

end