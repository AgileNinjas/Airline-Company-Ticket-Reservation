class Flight
attr_accessor :id , :capacity , :price
attr_accessor :first_class_capacity , :economic_class_capacity , :business_class_capacity
attr_accessor :economic_class_price , :first_class_price   , :business_class_price
 def initialize

   @id = 2
   @capacity = 120
   @price = 100
   @first_class_capacity = 20
   @economic_class_capacity = 100
   @business_class_capacity = 0
   @economic_class_price = 100
   @first_class_price = 200
   @business_class_price = 500

 end
end