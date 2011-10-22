class Query
#<<<<<<< HEAD
#=======
  attr_accessor :departure_city,:arrival_city,:start_date,:end_date
#>>>>>>> cd7bbf211a27320e5e5c32613497eb1a2e4b44f5



  def initialize(departure_city,arrival_city,start_date,end_date)


    @departure_city=departure_city
    @arrival_city=arrival_city
    @start_date=start_date
    @end_date=end_date
  end

end