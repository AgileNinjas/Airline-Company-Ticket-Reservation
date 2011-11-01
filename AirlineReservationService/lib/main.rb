require "../lib/flight_factory"
require "../lib/flight"
require "../lib/query"
require "../lib/flight_manager"
require "../lib/reservation_manager"
require "../lib/customer_manager"
require "../lib/customer"

class Main

  def initialize
    @flight_manager = Flight_manager.new
    @flight_factory = FlightFactory.new
    @customer_manager = Customer_manager.new
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

    #@flight_manager.get_schedule

    results = @flight_manager.search(query)


    if results.length == 0
       if @flight_manager.route_exist(query) == true
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
    flight_id = Integer(gets.chomp)
  end

  def show_details  flight_id


   # flight= @flight_factory.get_flight(flight_id)
    flight = @flight_manager.get_flight_by_id flight_id
    if (flight == nil)
      puts "Flight id doesn't exists"
    else
    puts "Flight name is: "+flight.name
    puts "Departure is: "+flight.departure
    puts "Arrival is: "+flight.arrival
    puts "Departure time is: "+flight.departure_time.to_s
    puts "Arrival time is: "+flight.arrival_time.to_s
    puts "Flight duration is: "+flight.duration.to_s + " hours"
    puts "Economic class price is: "+flight.economic_class_price.to_s + " pounds"
    puts "Business class price is: "+flight.business_class_price.to_s + " pounds"
    puts "First class price is: "+flight.first_class_price.to_s + " pounds"
    puts ""
    end
    return flight
  end


  def show_cust_details(passport)

    customer_details = @customer_manager.get_customer_by_passport_number(passport)

    if (customer_details == nil)
      puts "Customer doesn't exists"
    else
       puts "Customer id: "+customer_details.id.to_s
       puts "Customer name: "+customer_details.name.to_s
       puts "Customer passport: "+customer_details.passport.to_s
    end
  end


  def show_classes_available flight_id

    flight = @flight_factory.get_flight flight_id

    puts "Choose one of the classes available:"

    class_types_available=[];
      index = 1
    if (flight.available_seats_economic >0)
      puts index.to_s+". Economic class available    Price:"+flight.economic_class_price.to_s
      index=index+1
      class_types_available.push("economic")
    end

    if (flight.available_seats_business >0 )
      puts index.to_s+". Business class available    Price:"+flight.business_class_price.to_s
      index=index+1
      class_types_available.push("business")
    end

    if (flight.available_seats_first_class >0 )
      puts index.to_s+". First class available    Price:"+flight.first_class_price.to_s
      class_types_available.push("first")
    end

    return class_types_available[Integer(gets.chomp) - 1]

  end

  def show_reservation_details reservation

    flight = reservation.flight
    puts "You have reserved an flight with this reservation code:"+ generate_reservation_code(reservation).to_s
    puts ""
    puts "You have reserved a seat in the flight: " +flight.name+" of class: "+reservation.class_type+" departing from: "+flight.departure+" to Arrive at: "+flight.arrival
    puts ""

  end

  def get_customer_passport
    puts "*******  Search a customer ********"
    puts "Please insert your passport number:"
    passport = Integer(gets.chomp)
  end

  def generate_reservation_code reservation
    return reservation.confirmation_code
  end

  def reserve_flight
    flight_id = get_flight_id
    class_type = show_classes_available flight_id
    customer_passport_no = get_customer_passport
    reservation_manager = ReservationManager.new
    # refactor
    customer = Customer.new(1,"John Doe",customer_passport_no)
    reservation =  reservation_manager.add_new_reservation( customer ,@flight_factory.get_flight(flight_id),class_type)
    show_reservation_details reservation
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

  def show_choose_type_of_user_menu
    while 1
    puts "***********************************"
    puts "** Select the type of user :     **"
    puts "** 1. Customer                   **"
    puts "** 2. Airline Company            **"
    puts "** 3. Exit                       **"
    puts "***********************************"
    puts
    action=Integer(gets)
    if action == 1 then
      while 1
      action_id = show_main_menu
      case action_id
      when 1
        then show_search_interface
      when 2
        then show_flight_details
      when 3
        then reserve_flight
      when 4
        then show_customer_details
      when 5
        then customer_registration
      when 6
        then break
      end
        end
    end

    if action == 2 then
    while 1
    action_id=show_company_menu()
    case action_id
      when 1
        then show_adding_flight
      when 2
        then show_customer_details
      when 3
        then updating_flight_details
      when 4
        then check_flight_status
      when 5
        then break
    end

    end
    end

    if action == 3 then
      break
    end

    if action!=1 and action!=2 and action!=3 then
      puts "Enter a correct choice"
      show_choose_type_of_user_menu
    end

    end
  end

  def show_company_menu
    puts
    puts "***********************************"
    puts "** Select from the menu below :  **"
    puts "** 1.Add flight                  **"
    puts "** 2.Show customer details       **"
    puts "** 3.Update flight               **"
    puts "** 4.Check flight status         **"
    puts "** 5.Exit                        **"
    puts "***********************************"
    puts
    action=Integer(gets)

  end

  def show_main_menu
    puts
    puts "***********************************"
    puts "** Select from the menu below :  **"
    puts "** 1.Search for a flight         **"
    puts "** 2.Show flight details         **"
    puts "** 3.Reserve flight              **"
    puts "** 4.Show customer details       **"
    puts "** 5.Customer registration       **"
    puts "** 6.Exit                        **"
    puts "***********************************"
    puts
    action=Integer(gets)
  end

  def show_adding_flight
    puts "Please enter the following information"
    puts "--------------------------------------"
    puts "Please enter the name of flight: "
    name = gets.chomp.downcase
    puts "Please enter the Departure city: "
    departure_city = gets.chomp.downcase
    puts "Please enter the Arrival city: "
    arrival_city = gets.chomp.downcase
    puts "Please enter the first class capacity of the airplane: "
    first_class_capacity = Integer(gets.chomp)
    puts "Please enter the economic class capacity of the flight: "
    economic_class_capacity = Integer(gets.chomp)
    puts "Please enter the business class capacity of the flight: "
    business_class_capacity = Integer(gets.chomp)
    puts "Please enter the economic class price of the flight: "
    economic_class_price = Integer(gets.chomp)
    puts "Please enter the first class price of the flight: "
    first_class_price = Integer(gets.chomp)
    puts "Please enter the business class price of the flight : "
    business_class_price  = Integer(gets.chomp)
    puts "Please enter the duration of the flight: "
    duration = Integer(gets.chomp)
    puts "Please enter the departure time of the flight: "
    departure_time = Time.parse(gets.chomp)
    puts "Please enter the arrival time of the flight: "
    arrival_time = Time.parse(gets.chomp)

    begin

    flight=Flight.new(@flight_manager.create_id, name , departure_city , arrival_city, first_class_capacity ,economic_class_capacity,business_class_capacity,economic_class_price,first_class_price,business_class_price ,duration,departure_time,arrival_time, first_class_capacity ,economic_class_capacity,business_class_capacity)

    @flight_manager.create_flight(flight)
    puts "Your flight has been added successfully"
    rescue
        puts "System failed add your flight"
    end
  end


  def show_customer_details
     passport = get_customer_passport
     show_cust_details passport
  end


  def customer_registration
        puts "Enter the name:"
        customer_name = gets.chomp
        puts "Enter the passport:"
        customer_passport=Integer(gets.chomp)

        customer_object=Customer_manager.new
        customer=Customer.new(customer_object.create__customer_id,customer_name.to_s,customer_passport)
        customer_object.add_customer_xml(customer)

  end




  def show_interface
    show_choose_type_of_user_menu
  end

  def updating_flight_details
      flight= show_flight_details
      flight=get_new_flight_details(flight)

    begin

       @flight_manager.add_flight_xml(flight)
    puts "Your flight has been updated successfully"
    rescue
        puts "System failed update your flight"
    end
  end

  def get_new_flight_details(flight)


    while true do
       detail_no = show_details_to_choose
       if (detail_no != 14) then new_value = insert_new_value   end
       case detail_no
         when 1 then flight.name = new_value
         when 2 then flight.capacity = Integer(new_value)
         when 3 then flight.departure = new_value
         when 4 then flight.arrival = new_value
         when 5 then flight.first_class_capacity = Integer(new_value)
         when 6 then flight.economic_class_capacity = Integer(new_value)
         when 7 then flight.business_class_capacity = Integer(new_value)
         when 8 then flight.economic_class_price = Integer(new_value)
         when 9 then flight.first_class_price = Integer(new_value)
         when 10 then flight.business_class_price = Integer(new_value)
         when 11 then flight.duration = Integer(new_value)
         when 12 then flight.departure_time = Time.parse(new_value)
         when 13 then flight.arrival_time = Time.parse(new_value)
         when 14 then break
       end
  end

    return flight
  end

  def show_details_to_choose
    puts "Choose the detail you want to change:"
    puts "1. Name of flight "
    puts "2. Capacity of the airplane "
    puts "3. Departure city "
    puts "4. Arrival city"
    puts "5. First class capacity of the airplane"
    puts "6. Economic class capacity of the flight"
    puts "7. Business class capacity of the flight "
    puts "8. Economic class price of the flight"
    puts "9. First class price of the flight"
    puts "10. Business class price of the flight"
    puts "11. Duration of the flight"
    puts "12. Departure time of the flight"
    puts "13. Arrival time of the flight"
    puts "14. Exit"
    detail_no_chosen= Integer(gets.chomp)
    if (detail_no_chosen<1) or (detail_no_chosen>14)
      puts "Insert correct detail number"
      show_details_to_choose
    else
      return detail_no_chosen
    end
  end

  def insert_new_value
    puts "Insert the new value:"
    return gets.chomp
  end

  def show_list_of_flights

    puts "Available flights:"
    @flight_manager.flights.each { |flight|
       puts "Flight id:"+flight.id.to_s+"    flight name:"+flight.name
    }
    puts ""

  end

  def show_status_for_flight flight_id
    flight = @flight_factory.get_flight flight_id
    puts "Status of the flight :"+flight.name
    puts "Departure city: "+flight.departure+ "   Arrival city: "+flight.arrival
    puts "Departure date: "+flight.departure_time.to_s
    puts "Available seats on economic class: "+flight.available_seats_economic.to_s+"  Reserved seats: "+(flight.economic_class_capacity - flight.available_seats_economic).to_s
    puts "Available seats on business class: "+flight.available_seats_business.to_s+"  Reserved seats: "+(flight.business_class_capacity - flight.available_seats_business).to_s
    puts "Available seats on first class: "+flight.available_seats_first_class.to_s+"  Reserved seats: "+(flight.first_class_capacity - flight.available_seats_first_class).to_s
    puts "Total income from the flight: "+flight.get_income.to_s
  end

  def check_flight_status
    show_list_of_flights
    flight_id = get_flight_id
    show_status_for_flight flight_id
  end

end