class Query

  attr_accessor :departure_city,:arrival_city,:date


  def initialize(departure_city,arrival_city,date,end_date)


    @departure_city=departure_city
    @arrival_city=arrival_city
    @date=date
    @end_date=end_date
  end

end