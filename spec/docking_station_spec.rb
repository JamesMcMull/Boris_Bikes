require './lib/docking_station'
require './lib/bike.rb'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }

    describe '.new' do
      context 'accepts 1 parameter' do
        it { expect { DockingStation.new(50) }.not_to raise_error }
      end
      context 'accepts no parameters' do
        it { expect(DockingStation.new.capacity).to eq(20) }
      end
    end

    describe '#release_bike' do
        it 'releases a working bike' do
            bike = Bike.new
            subject.docking_bike(bike)
            expect(bike).to respond_to(:working?)
            expect(subject.release_bike).to eq bike
        end
    end
    
    describe '#release_bike' do
      it 'raises an error if no bike' do
        expect { subject.release_bike }.to raise_error 'No bikes'
      end
      it 'accepts all bikes' do
        bike = Bike.new
        bike.is_broken
        subject.docking_bike(bike)
        bike_two = Bike.new
        subject.docking_bike(bike_two)
        expect(subject.bikes.length).to eq(2)
      end
        it 'only releases working bikes' do
        bike = Bike.new
        bike.is_broken
        subject.docking_bike(bike)
        bike_two = Bike.new
        subject.docking_bike(bike_two)
        2.times { subject.release_bike }
        expect(subject.bikes.length).to eq(1)
      end
    end

  describe '#docking_bike' do
    it { is_expected.to respond_to(:docking_bike).with(1).argument }
    it 'checks last bike is last bike when docked' do
      bike = Bike.new
      subject.docking_bike(bike)
      bikes = subject.bikes
      expect(bikes[-1]).to eq bike
    end
    it 'docks a bike with 2 parameters' do
      bike = Bike.new
      subject.docking_bike(bike, true)
      expect(bike.broken).to eq(true)
    end
    it 'raises an error if no dock' do
      DockingStation.new.capacity.times {subject.docking_bike(Bike.new)}
      expect { subject.docking_bike Bike.new }.to raise_error 'No space in dock'
    end
  end
end

