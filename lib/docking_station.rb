require './lib/bike.rb'

class DockingStation
    attr_reader :bikes, :capacity
    DEFAULT_CAPACITY = 20
    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
    end
    def release_bike
      fail 'No bikes' if empty? 
      working_bike = bikes.find { |bike| bike if !bike.broken }
      @bikes.delete(working_bike)
      working_bike
    end
    def docking_bike(bike, is_broken=false)
      bike.is_broken if is_broken
      fail 'No space in dock' if full?
      @bikes << bike
    end
    private
    
    def full?
      @bikes.length >= DEFAULT_CAPACITY
    end
    def empty?
      @bikes.empty?
    end
end

 