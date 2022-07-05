require 'rails_helper'

RSpec.describe PnrHistory, :type => :model do
    describe "associations" do
                it { should belong_to(:pnr) } 
                it { should belong_to(:ticket) } 
            end
end