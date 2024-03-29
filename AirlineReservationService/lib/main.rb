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
      puts "Results of your search ordered by price and duration:"
      puts "---------------------------------------------------------"
      results.each {|flight| puts "Flight: " +flight.id.to_s
      puts "Economic price: " +flight.economic_class_price.to_s  + " pounds"
      puts "Duration: "+ flight.duration.to_s  + " hours"
      puts "Departure date: "+flight.departure_time.to_s
      puts "Arrival date: "+flight.arrival_time.to_s
      puts "---------------"}

    end
  end



  def get_flight_id
    puts "**************************"
    puts "Please enter the flight id:"
    flight_id = gets.chomp.to_i
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

       if (flight == nil)
         puts "Invalid! Check the flight ID entered and try again:"
         #show_main_menu
         #return show_classes_available flight_id
       else

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

        selected_class = gets.chomp.to_i
        if (selected_class<1) or (selected_class > 3) then
          puts "Invalid option. Insert another value"
          return show_classes_available flight_id
        end
        return class_types_available[selected_class - 1]

       end

  end

  def show_reservation_details reservation

    flight = reservation.flight
    puts "You have reserved this flight with the reservation code:"+ generate_reservation_code(reservation).to_s
    puts ""
    puts "You have reserved a seat in the flight: " +flight.name+" of class: "+reservation.class_type+" departing from: "+flight.departure+" and arriving at: "+flight.arrival
    puts ""

  end

  def get_customer_passport
   puts "************************************"
    puts "Please insert your passport number:"
    passport = gets.chomp.to_i
    if (passport < 1) then
      puts "Invalid passport number (value should > 0 )"
      return get_customer_passport
    else
      return passport
    end

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
    customer =@customer_manager.get_customer_by_passport_number(customer_passport_no)

    if (customer!=nil) then
     reservation =  reservation_manager.add_new_reservation( customer ,@flight_factory.get_flight(flight_id),class_type)
    show_reservation_details reservation
    else
      puts "The passport entered doesn't correspond to a registered user"
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

  def show_choose_type_of_user_menu
    while 1
    puts "***********************************"
    puts "** Select the type of user :     **"
    puts "** 1. Customer                   **"
    puts "** 2. Airline Company            **"
    puts "** 3. Exit                       **"
    puts "***********************************"
    puts

    action = gets

    if action.to_i == 1 then
      while 1
      action_id = show_main_menu
      case action_id.to_i
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
        else
          puts 'Invalid option. Please select again'
          show_main_menu
      end
        end


   elsif action.to_i == 2 then
    while 1
    action_id= show_company_menu()
    case action_id.to_i
      when 1
        then show_customer_details
      when 2
         then check_flight_status
      when 3
           then show_adding_flight
      when 4
           then updating_flight_details
      when 5
        then break

        else
          puts 'Invalid option. Please select again'
          show_main_menu
    end

    end

    elsif action.to_i == 3 then
      puts 'Thanks for using our services '
      exit

   else
      puts "Enter a correct choice"
      show_choose_type_of_user_menu
    end

    end
  end

  def show_company_menu
    puts
    puts "***********************************"
    puts "** Select from the menu below :  **"
    puts "** 1.Show customer details       **"
    puts "** 2.Check flight status         **"
    puts "** 3.Add flight                  **"
    puts "** 4.Update flight               **"
    puts "** 5.Exit                        **"
    puts "***********************************"
    puts
    action=gets

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
    action=gets
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
    puts "Please enter the economic class capacity of the flight: "
    economic_class_capacity = gets.chomp.to_i
    puts "Please enter the economic class price of the flight (in pounds): "
    economic_class_price = gets.chomp.to_i
    puts "Please enter the business class capacity of the flight: "
    business_class_capacity = gets.chomp.to_i
    puts "Please enter the business class price of the flight (in pounds): "
    business_class_price  =  gets.chomp.to_i
    puts "Please enter the first class capacity of the airplane: "
    first_class_capacity =  gets.chomp.to_i
    puts "Please enter the first class price of the flight (in pounds): "
    first_class_price =  gets.chomp.to_i


    puts "Please enter the duration of the flight: "
    duration =  gets.chomp.to_i
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
        customer_passport=gets.chomp.to_i
        if (customer_passport < 1) then
          puts "Invalid passport number ( value > 0 )"
          return customer_registration
        else
          customer=Customer.new(@customer_manager.create__customer_id,customer_name.to_s,customer_passport)
          @customer_manager.add_customer_xml(customer)
          puts "Registration completed"
        end

       # customer_object=Customer_manager.new

  end




  def show_interface
    show_choose_type_of_user_menu
  end

  def updating_flight_details
      flight= show_flight_details
      flight=get_new_flight_details(flight)

    begin

    @flight_manager.add_flight_xml(flight)
    puts "Your changes has been updated successfully"
    rescue
        puts "System failed update your flight"
    end
  end

  def get_new_flight_details(flight)


    while true do
       detail_no = show_details_to_choose
       if (detail_no != 13) then new_value = insert_new_value   end
       case detail_no
         when 1 then flight.name = new_value
         when 2 then flight.departure = new_value
         when 3 then flight.arrival = new_value
         when 4 then flight.first_class_capacity = new_value.to_i
         when 5 then flight.economic_class_capacity = new_value.to_i
         when 6 then flight.business_class_capacity = new_value.to_i
         when 7 then flight.economic_class_price = new_value.to_i
         when 8 then flight.first_class_price = new_value.to_i
         when 9 then flight.business_class_price = new_value.to_i
         when 10 then flight.duration = new_value.to_i
         when 11 then flight.departure_time = Time.parse(new_value)
         when 12 then flight.arrival_time = Time.parse(new_value)
         when 13 then break
         else
          puts 'Invalid option. Please select again'
          show_details_to_choose
       end
  end

    return flight
  end

  def show_details_to_choose
    puts "Choose the detail you want to change:"
    puts "***********************************************************"
    puts "1. Name of flight "
    puts "2. Departure city "
    puts "3. Arrival city"
    puts "4. First class capacity of the airplane"
    puts "5. Economic class capacity of the flight"
    puts "6. Business class capacity of the flight "
    puts "7. Economic class price of the flight"
    puts "8. First class price of the flight"
    puts "9. Business class price of the flight"
    puts "10. Duration of the flight"
    puts "11. Departure time of the flight(dd-mm-yyyy hh:mm)"
    puts "12. Arrival time of the flight(dd-mm-yyyy hh:mm)"
    puts "***********************************************************"
    puts "13. Save your changes"
    puts "***********************************************************"
    detail_no_chosen=gets.chomp.to_i
    if (detail_no_chosen<1) or (detail_no_chosen>13)
      puts "!!!!!!!!!!!! Insert correct choice (between 1-13) !!!!!!!!!!!"
      puts "*******************************************"
      show_details_to_choose

    else
      return detail_no_chosen
    end
  end

  def insert_new_value
    puts "Insert the new value:"
    return gets.chomp
    system("clear")
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
