require 'rails_helper'

RSpec.describe Property, type: :model do
  subject do
    Property.new(name: 'A modern house by the lake',
                 description: ' avery nice house with a lake view and sunny mornings',
                 address: '123 New St, new city')
  end
  before { subject.save }

  it 'name should not be nill' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should not be nill' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'address should not be nill' do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it 'photos should not be nill' do
    subject.photos = nil
    expect(subject).to_not be_valid
  end

  it 'name should be at least 6 char' do
    subject.name = 'flat'
    expect(subject).to_not be_valid
  end
end
