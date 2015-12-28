require 'van'
describe Van do
  subject(:van) { described_class.new }
  let(:bike) { double :bike }
  let(:station) { double :station, broken_bikes: bike}

  describe '#load' do
    it 'loads a bike on to the van' do
      van.load(station)
      expect(van.loaded_bikes).to eq [bike]
    end
  end
end
