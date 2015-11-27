require 'van'


describe Van do
  describe '#load' do
    subject{Van.new}
    it { is_expected.to respond_to(:load).with(1).arguments }

    it 'will show loaded bikes' do
      bike = double(:bike)
      station = double(:station, broken_bikes: bike)
      subject.load(station)
      expect(subject.loaded_bikes).to eq [bike]
    end


    end
end
