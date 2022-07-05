require 'rails_helper'

RSpec.describe Flight, :type => :model do
    describe "associations" do
                it{ is_expected.to have_many(:tickets)}
            end
end