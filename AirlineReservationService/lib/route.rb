class Route
attr_accessor :id , :capacity , :price
attr_accessor :first_class_capacity , :economic_class_capacity , :business_class_capacity
attr_accessor :economic_class_price , :first_class_price   , :business_class_price
attr_accessor :name , :departure , :arrival
attr :flights
 def initialize  (id=1 , name="default" , capacity=120 , departure = "departure" , arrival= "arrival")

   @name = name
   @id = id
   @capacity = capacity
   @price = 100
   @first_class_capacity = 20
   @economic_class_capacity = 100
   @business_class_capacity = 0
   @economic_class_price = 100
   @first_class_price = 200
   @business_class_price = 500

   @departure = departure
   @arrival = arrival

   @flights=[]

 end

 def add_flight

 end
end