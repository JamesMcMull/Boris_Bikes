require './lib/bike.rb'

class DockingStation
    attr_reader :bikes
    def initialize
        @bikes = []
    end
    def bikes
        @bikes
    end
    def release_bike
      fail 'No bikes' if empty?
      @bikes.pop
    end
    def docking_bike(bike)
      fail 'No space in dock' if full?
      @bikes << bike
    end
    private
    
    def full?
      @bikes.length >= 20
    end
    def empty?
      @bikes.empty?
    end
end
