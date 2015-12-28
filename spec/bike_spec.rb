require 'Bike'

describe Bike do
  subject(:bike) { described_class.new }

  describe '#working' do
    it { is_expected.to respond_to :working? }
  end

  describe '#report_broken' do
    it 'reports a bike as broken' do
      bike.report_broken
      expect(bike).to be_broken
    end
  end

  describe '#fixed' do
    it 'makes a bike work' do
      bike.fixed
      expect(bike.working?).to eq true
    end
  end

end
