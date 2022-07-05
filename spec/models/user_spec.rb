require 'rails_helper'

RSpec.describe User, :type => :model do
    describe "associations" do
                it{ is_expected.to have_many(:passengers)}
                it{ is_expected.to have_many(:tickets)}
                it{ is_expected.to have_many(:pnrs)}
            end
end