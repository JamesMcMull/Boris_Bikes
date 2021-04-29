require './lib/bike.rb'

describe Bike do
    it { is_expected.to respond_to(:working?) }
    it 'is not broken by default' do
      expect(subject.broken).to eq(false)
    end
    it 'is broken when #is_broken' do
      subject.is_broken
      expect(subject.broken).to eq(true)
    end
end