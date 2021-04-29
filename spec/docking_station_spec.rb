require './lib/docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }

    describe '#release_bike' do
        it 'releases a working bike' do
            bike = Bike.new
            subject.docking_bike(bike)
            expect(subject.release_bike).to eq bike
        end
    end

    it { is_expected.to respond_to(:docking_bike).with(1).argument }

    it 'Docking a bike' do
        bike = Bike.new
        expect(subject.docking_bike(bike)).to eq bike
    end

    describe '#release_bike' do
        it 'raises an error if no bike' do
            expect { subject.release_bike }.to raise_error 'No bike'
        end
    end
    describe '#docking_bike' do
    it 'raises an error if no dock' do
        subject.docking_bike(Bike.new)
        expect { subject.docking_bike Bike.new }.to raise_error 'No dock'
        end
    end
end

