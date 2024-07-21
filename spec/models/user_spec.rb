require 'rails_helper'

RSpec.describe User, type: :model do
    describe "validations" do
        subject(:user) { user }

        context "when username is empty" do
            let(:user) { build(:user, username: nil) }

            it "throws an error" do
                expect(subject).to_not be_valid
                expect(subject.errors[:username]).to include("can't be blank")
            end
            it "is invalid" do
                expect(subject).to_not be_valid
                expect(subject.errors[:username]).to include("can't be blank")
              end
            end
        
            context "when email is already taken" do
              let!(:user1) { create(:user, email: "test@example.com") }
              let(:user2) { build(:user, email: "test@example.com", password: "password", password_confirmation: "password") }
        
              it "is invalid" do
                expect(user2).not_to be_valid
                expect(user2.errors[:email]).to include("has already been taken")
              end
            end
        
            context "when email is invalid" do
              let(:user) { build(:user, email: "plainaddress", password: "password", password_confirmation: "password") }
        
              it "is invalid" do
                expect(user).not_to be_valid
                expect(user.errors[:email]).to include("is invalid")
              end
            end
          end
        end
        




