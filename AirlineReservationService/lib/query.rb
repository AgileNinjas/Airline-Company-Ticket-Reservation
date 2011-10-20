class Query
  attr_accessor :departure_city,:arrival_city,:start_date,:end_date



  def initialize(departure_city,arrival_city,start_date,end_date)


    @departure_city=departure_city
    @arrival_city=arrival_city
    @start_date=start_date
    @end_date=end_date
  end
end