require "../lib/flight_factory"
require "../lib/flight"

class Main

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
    puts "Flight duration is: "+flight.duration
    puts "Economic class is: "+flight.economic_class_price.to_s
    puts "Business class is: "+flight.business_class_price.to_s
    puts "First class is: "+flight.first_class_price.to_s
    end
  end


  def show_flight_details
    id = get_flight_id
    show_details id
  end

  def show_main_menu
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
        then
      when 2
        then show_flight_details
      when 3
        then break
    end

    end

  end

end