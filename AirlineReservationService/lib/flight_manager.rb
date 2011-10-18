require "../lib/route.rb"
class Flight_manager
  attr_accessor :flights
        def initialize
          @flights=[]
        end
  
  def add_flight(flight)
    @flights.push(flight)
  end
  def search(query)
    
  end
  
end