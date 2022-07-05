require 'rails_helper'

RSpec.describe Pnr, :type => :model do
    describe "associations" do
                it { should belong_to(:user) } 
                it{ is_expected.to have_many(:pnr_histories)}
                it{ is_expected.to have_many(:tickets)}
            end
end