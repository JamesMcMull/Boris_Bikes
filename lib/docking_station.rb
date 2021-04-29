class DockingStation
    attr_reader :bike
    def bike
        @bike
    end
    def docking_bike(bike)
        fail 'No dock' if @bike
        @bike = bike
    end
    def release_bike
        fail 'No bike' unless @bike
        @bike
    end
end

class Bike
    def working?
        true
    end
end