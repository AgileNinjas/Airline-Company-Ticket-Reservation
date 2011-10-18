class Reservation
  attr_accessor :max_economic_counter, :max_business_counter


  def initialize(capacity_economic=180.0, capacity_business=20.0)
    @max_economic_counter = capacity_economic
    @max_business_counter = capacity_business
  end



end