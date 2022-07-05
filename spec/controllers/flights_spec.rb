require 'rails_helper'

RSpec.describe FlightsController, :type => :controller do

        it "renders index page" do
            flight = create(:flight)
            get :index
            expect(assigns(:flights)).to eq([flight])
            expect(response).to render_template("index")
            expect(response).to have_http_status(200)
        end

end