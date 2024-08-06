require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject(:user) { build(:user) }

    context "when username is empty" do
      before { user.username = nil }

      it "is invalid" do
        expect(user).not_to be_valid
        expect(user.errors[:username]).to include("can't be blank")
      end
    end

    context "when email is already taken" do
      let!(:user1) { create(:user, email: "test@example.com") }
      let(:user2) { build(:user, email: "test@example.com", password: "password", password_confirmation: "password") }

      it "is invalid" do
        user.email = "test@example.com"
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("has already been taken")
      end
    end

    context "when email is invalid" do
      it "is invalid" do
        user.email = "plainaddress"
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("is invalid")
      end
    end
  end
  describe "associations" do 
    it { should have_many(:articles).dependent(:nullify) }
  end
end





