require 'rails_helper'

RSpec.describe TicketsController, :type => :controller do

        it "renders index page" do
            passenger = create(:passenger)
            ticket = create(:ticket, passenger_id: passenger.id)
            get :index, params:{format: passenger.id}
            expect(assigns(:tickets)).to eq([ticket])
            expect(response).to render_template("index")
            expect(response).to have_http_status(200)
        end

        it "renders show page" do
            ticket = create(:ticket)
            get :show, params:{id: ticket.id}
            assigns(:ticket).should eq (ticket)
            expect(response).to render_template("show")
            expect(response).to have_http_status(200)
        end

        


end