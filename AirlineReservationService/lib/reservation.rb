class Reservation
  attr_accessor :max_economic_counter, :max_business_counter, :available_economic_seats


  def initialize(capacity_economic=180.0, capacity_business=20.0)
    @max_economic_counter = capacity_economic
    @max_business_counter = capacity_business
  end

  def search_available_seats(kind_of_seat,number_of_seats)
    if kind_of_seat == "economic"
        if number_of_seats < @max_economic_counter
          @max_economic_counter = @max_economic_counter - number_of_seats
          true
        else
          false

    end
  end

    #elsif kind_of_seat=="business"
    #  if seat < @max_business_counter
    #    puts "There are available business seats"
    #  else
    #    puts "There are not available business seats"
    #  end
  end

end
