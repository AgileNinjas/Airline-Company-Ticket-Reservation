class Flight
<<<<<<< HEAD
attr_accessor :id_flight , :capacity , :price
attr_accessor :first_class_capacity , :economic_class_capacity , :business_class_capacity
attr_accessor :economic_class_price , :first_class_price   , :business_class_price

 def initialize

   @capacity = 120
   @price = 100
   @first_class_capacity = 20
   @economic_class_capacity = 100
   @business_class_capacity = 0
   @economic_class_price = 100
   @first_class_price = 200
   @business_class_price = 500

=======
attr_accessor :id , :capacity
attr_accessor :first_class_capacity , :economic_class_capacity , :business_class_capacity
attr_accessor :economic_class_price , :first_class_price   , :business_class_price
attr_accessor :name , :departure , :arrival
attr_accessor :available_seats_business  ,:available_seats_economic , :available_seats_first_class
attr_accessor :duration ,:departure_time ,:arrival_time
# def initialize  (id=1 , name="default" , capacity=120 , departure = "departure" , arrival= "arrival", first_class_capacity = 20,economic_class_capacity = 100,business_class_capacity = 0,economic_class_price = 100,first_class_price = 500,business_class_price = 200)
   def initialize  (id, name , capacity , departure , arrival, first_class_capacity ,economic_class_capacity ,business_class_capacity,economic_class_price,first_class_price,business_class_price , duration , departure_time , arrival_time)

   @name = name
   @id = id
   @capacity = capacity
>>>>>>> cd7bbf211a27320e5e5c32613497eb1a2e4b44f5

   @first_class_capacity = first_class_capacity
   @economic_class_capacity = economic_class_capacity
   @business_class_capacity =business_class_capacity
   @economic_class_price = economic_class_price
   @first_class_price =first_class_price
   @business_class_price =business_class_price

   @departure = departure
   @arrival = arrival
   @available_seats_business=  business_class_capacity
   @available_seats_economic =  economic_class_capacity
   @available_seats_first_class = first_class_capacity

   @duration = duration

   @departure_time = departure_time
   @arrival_time = arrival_time
 end

<<<<<<< HEAD
   def flight_id(id_flight=2)
      @id_flight = id_flight
   end

=======
>>>>>>> cd7bbf211a27320e5e5c32613497eb1a2e4b44f5

end