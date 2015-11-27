require 'Bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it 'reports if bike broken when docked' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
