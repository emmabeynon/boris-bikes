require 'van'
describe Van do
  subject(:van) { described_class.new }
  let(:bike) { double :bike }
  let(:station) { double :station, broken_bikes: [bike]}
  let(:garage) { double :garage }

  describe '#load' do
    it 'loads a bike on to the van' do
      allow(bike).to receive(:each) { :bike }
      van.load(station)
      expect(van.loaded_bikes).to eq [bike]
    end
  end

  describe '#deliver' do
    it 'delivers a bike to the garage' do
      allow(bike).to receive(:each) { :bike }
      van.load(station)
      allow(garage).to receive(:received_bikes) { [] }
      van.deliver(garage)
      expect(van.loaded_bikes).to be_empty
    end
  end

  describe '#collect' do
    xit 'collects a working bike from the garage' do
      van.collect(garage)
      expect(van.loaded_bikes).to eq [bike]
    end
  end
end
