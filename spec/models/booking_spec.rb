require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject do
    Booking.new(user_id: 1, property_id: 1,
                check_in: 3 / 0o1 / 2023, check_out: 0o5 / 0o1 / 2023)
  end
  before { subject.save }

  it 'user_id should not be nill' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'property_id should not be nill' do
    subject.property_id = nil
    expect(subject).to_not be_valid
  end

  it 'check_in should not be nill' do
    subject.check_in = nil
    expect(subject).to_not be_valid
  end

  it 'check_out should not be nill' do
    subject.check_out = nil
    expect(subject).to_not be_valid
  end
end
