require 'rails_helper'

RSpec.describe User, type: :model do
  it "es válido con datos válidos" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "requiere email único" do
    create(:user, email: "test@example.com")
    user = build(:user, email: "test@example.com")
    expect(user).not_to be_valid
  end
end
