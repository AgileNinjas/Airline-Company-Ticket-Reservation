class Query
<<<<<<< HEAD
=======
#<<<<<<< HEAD
#=======
  attr_accessor :departure_city,:arrival_city,:start_date,:end_date
#>>>>>>> cd7bbf211a27320e5e5c32613497eb1a2e4b44f5
>>>>>>> f6b7d3d1257d3c65b403fee2d1f2714f16c10657

  attr_accessor :departure_city,:arrival_city,:date



  def initialize(departure_city,arrival_city,date,end_date)


    @departure_city=departure_city
    @arrival_city=arrival_city
    @date=date
    @end_date=end_date
  end

end