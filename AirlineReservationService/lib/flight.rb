class Flight
attr_accessor :id , :capacity , :price
attr_accessor :first_class_capacity , :economic_class_capacity , :business_class_capacity
 def initialize
   @id = 2
   @capacity = 120
   @price = 100
   @first_class_capacity = 20
   @economic_class_capacity = 100
   @business_class_capacity = 0
 end
end