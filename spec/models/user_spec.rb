require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: 'JohnDoe@JohnDoe.com', password: '123456') }
  before { subject.save }

  it 'email should not be nill' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should not be nill' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'password should be at least 6 char' do
    subject.password = '12345'
    expect(subject).to_not be_valid
  end
end