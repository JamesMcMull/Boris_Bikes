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
        fail 'No bikes' if @bikes.empty?
        @bikes.pop
    end
    def docking_bike(bike)
        fail 'No space in dock' if @bikes.length >= 20
        @bikes << bike
    end
end

