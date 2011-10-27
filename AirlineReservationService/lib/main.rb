require "../lib/flight_factory"
require "../lib/flight"
require "../lib/query"
require "../lib/flight_manager"
require "../lib/reservation_manager"

class Main

  def initialize
    @flight_factory = FlightFactory.new
  end

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
     flight_manager.get_schedule

    results = flight_manager.search(query)


    if results.length == 0
       if flight_manager.route_exist(query) == true
        puts "There is no flight corresponding to your search parameters, but the searched route exist"

       else
         puts "There is no flight corresponding to your sear ch parameters and the searched route does not exist"
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
    flight_id = Integer(gets.chomp)
  end

  def show_details  flight_id


    flight= @flight_factory.get_flight(flight_id)
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

  def show_classes_available flight_id

    flight = @flight_factory.get_flight flight_id

    puts "Choose one of the classes available:"

    class_types_available=[];
      index = 1
    if (flight.max_economic_counter > 0 )
      puts index.to_s+". Economic class available    Price:"+flight.economic_class_price.to_s
      index=index+1
      class_types_available.push("economic")
    end

    if (flight.max_business_counter >0 )
      puts index.to_s+". Business class available    Price:"+flight.business_class_price.to_s
      index=index+1
      class_types_available.push("business")
    end

    if (flight.max_first_class_counter >0 )
      puts index.to_s+". First class available    Price:"+flight.first_class_price.to_s
      class_types_available.push("first")
    end

    class_types_available[Integer(gets.chomp) - 1]

  end

  def get_customer_passport_no

    puts "In order to reserve you have to be registered. Please insert your passport number:"
    gets.chomp
  end

  def generate_reservation_code reservation
    return reservation.confirmation_code
  end

  def reserve_flight
    flight_id = get_flight_id
    class_type = show_classes_available flight_id
    customer_passport_no = get_customer_passport_no
    reservation_manager = ReservationManager.new
    reservation =  reservation_manager.create_reservation(Customer.new(1,"John Doe",customer_passport_no) ,@flight_factory.get_flight(flight_id),class_type)
    puts "You have reserved an flight with this reservation code:"+ generate_reservation_code(reservation).to_s
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
    puts "** 3.Reserve flight              **"
    puts "** 4.Exit                        **"
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
        then reserve_flight
      when 4
        then break
    end

    end


  end

end