require 'rails_helper'

RSpec.describe User, type: :model do

  it "always has an authentication_token" do
    u = User.create!(email: 'dwayne@d.co', password: '123456', password_confirmation: '123456')
    u.authentication_token = nil
    u.save
    expect(u.authentication_token).not_to be_nil
  end

  it "validates email uniqueness" do
    User.create!(email: 'dwayne@d.co', password: '123456', password_confirmation: '123456')
    u = User.new(email: 'dwayne@d.co', password: '123456', password_confirmation: '123456')
    u.valid?
    expect(u.errors.messages[:email]).to eq ["has already been taken"] 
  end
end
