require 'rails_helper'

RSpec.describe Passenger, :type => :model do
        subject {
            build(:passenger)
        }

        it "is valid with valid attributes" do
            expect(subject).to be_valid
        end

        it "is not valid without a name" do
            subject.name=nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an age" do
            passenger2 = build(:passenger, age: nil)
            expect(passenger2).to_not be_valid
        end

        it "is not valid without an email" do
            passenger2 = build(:passenger, email: nil)
            expect(passenger2).to_not be_valid
        end

        it "is not valid without contact" do
            passenger2 = build(:passenger, contact: nil)
            expect(passenger2).to_not be_valid
        end

        describe "associations" do
            it{ is_expected.to have_many(:tickets) }
            it{ is_expected.to have_many(:flights) }
            it { should belong_to(:user) } 
          end
end