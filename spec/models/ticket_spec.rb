require 'rails_helper'

RSpec.describe Ticket, :type => :model do
    describe "associations" do
                it{ should belong_to(:passenger) }
                it{ should belong_to(:flight) }
                it { should belong_to(:user) } 
            end
end