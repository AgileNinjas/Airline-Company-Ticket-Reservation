class Flight


attr_accessor :id , :capacity
attr_accessor :first_class_capacity , :economic_class_capacity , :business_class_capacity
attr_accessor :economic_class_price , :first_class_price   , :business_class_price
attr_accessor :name , :departure , :arrival
attr_accessor :available_seats_business  ,:available_seats_economic , :available_seats_first_class
attr_accessor :duration ,:departure_time ,:arrival_time

# def initialize  (id=1 , name="default" , capacity=120 , departure = "departure" , arrival= "arrival", first_class_capacity = 20,economic_class_capacity = 100,business_class_capacity = 0,economic_class_price = 100,first_class_price = 500,business_class_price = 200)
   def initialize  (id, name , capacity , departure , arrival, first_class_capacity ,economic_class_capacity ,business_class_capacity,economic_class_price,first_class_price,business_class_price , duration , departure_time , arrival_time,first_class_availability ,economic_class_availability ,business_class_availability)

   @name = name
   @id = id
   @capacity = capacity

   @first_class_capacity = first_class_capacity
   @economic_class_capacity = economic_class_capacity
   @business_class_capacity =business_class_capacity
   @economic_class_price = economic_class_price
   @first_class_price =first_class_price
   @business_class_price =business_class_price

   @departure = departure
   @arrival = arrival

   @available_seats_business=  business_class_availability
   @available_seats_economic =  economic_class_availability
   @available_seats_first_class = first_class_availability


   @duration = duration

   @departure_time = departure_time
   @arrival_time = arrival_time
 end

  def flight_id(id_flight=2)
      @id_flight = id_flight
  end

  def compare objFlight
    if (self.economic_class_price == objFlight.economic_class_price)
        return self.duration <=> objFlight.duration
    else
        return self.economic_class_price <=> objFlight.economic_class_price
    end





  end



  def search_available_seats(kind_of_seat,number_of_seats)
    if kind_of_seat == "economic"
        if number_of_seats < @available_seats_economic
          true
        else
          false

        end

    elsif kind_of_seat=="business"
        if number_of_seats < @available_seats_business
          true
        else
          false
        end

    elsif kind_of_seat=="first"
           if number_of_seats < @available_seats_first_class
             true
           else
             false
           end
    end
  end

  def update_available_seats reservation
    if reservation.class_type == "economic"
          @available_seats_economic = @available_seats_economic - 1
    elsif reservation.class_type=="business"
          @available_seats_business = @available_seats_business - 1
    elsif reservation.class_type=="first"
          @available_seats_first_class = @available_seats_first_class - 1
    end
  end


  def get_income
    ((economic_class_capacity - available_seats_economic)*economic_class_price+(business_class_capacity - available_seats_business)*business_class_price+(first_class_capacity - available_seats_first_class)*first_class_price)
  end

end
