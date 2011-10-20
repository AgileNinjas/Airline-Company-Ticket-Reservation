class Flight
attr_accessor :id , :capacity
attr_accessor :first_class_capacity , :economic_class_capacity , :business_class_capacity
attr_accessor :economic_class_price , :first_class_price   , :business_class_price
attr_accessor :name , :departure , :arrival
attr_accessor :available_seats_business  ,:available_seats_economic , :available_seats_first_class
 def initialize  (id=1 , name="default" , capacity=120 , departure = "departure" , arrival= "arrival", first_class_capacity = 20,economic_class_capacity = 100,business_class_capacity = 0,economic_class_price = 100,first_class_price = 500,business_class_price = 200)

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
   @available_seats_business=  @business_class_capacity
   @available_seats_economic =  economic_class_capacity
   @available_seats_first_class = first_class_capacity
 end


end