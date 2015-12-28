require 'van'
describe Van do
  subject(:van) { described_class.new }
  let(:bike) { double :bike, each: :bike }
  let(:station) { double :station, broken_bikes: [bike]}
  let(:garage) { double :garage, working_bikes: [bike] }

  describe '#load' do
    it 'loads a bike on to the van' do
      van.load(station)
      expect(van.loaded_bikes).to eq [bike]
    end
  end

  describe '#deliver' do
    it 'delivers a bike to the garage' do
      van.load(station)
      allow(garage).to receive(:received_bikes) { [] }
      van.deliver(garage)
      expect(van.loaded_bikes).to be_empty
    end
  end

  describe '#collect' do
    it 'collects a working bike from the garage' do
      van.collect(garage)
      expect(van.loaded_bikes).to eq [bike]
    end
  end

  describe '#distribute' do
    it 'distributes bikes to the docking station' do
      van.collect(garage)
      allow(station).to receive(:dock) { [bike] }
      van.distribute(station)
      expect(van.loaded_bikes).to be_empty
    end
  end
end
