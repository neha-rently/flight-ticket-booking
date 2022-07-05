require 'rails_helper'

RSpec.describe PassengersController, :type => :controller do

    context "Unauthorized user" do
        it "redirects to login page" do
            get :index
            expect(response).to redirect_to("/users/sign_in")
            expect(response).to have_http_status(302)
        end
    end

    context "Authorized user" do
        it "renders index page" do
            sign_in create(:user)
            get :index
            expect(response).to render_template("index")
            expect(response).to have_http_status(200)
        end

        it "renders show page" do
            sign_in create(:user)
            test_passenger = create(:passenger)
            get :show, params: {id:test_passenger.id}
            expect(response).to render_template("show")
            expect(response).to have_http_status(200)
            expect(assigns(:passenger).name).to eq(test_passenger.name)
            expect(assigns(:ticket)).to eq(nil)
        end

        it "creates new pnr" do
            sign_in create(:user)
            expect {
                get :create_pnr, params: {id: 2, count: 2}
            }.to change(Pnr, :count).by(1)
        end

        it "render new form to create passenger" do
            sign_in create(:user)
            get :new, params: {pid: create(:passenger).id, pnr: 3, id: 3}
            expect(response).to render_template("new")
        end

        it "render new form to edit passenger" do
            sign_in create(:user)
            get :edit, params: {id: create(:passenger).id}
            expect(response).to render_template("edit")
        end
       
        it "render updates passenger" do
            sign_in create(:user)
            put :update, params: {id: create(:passenger).id, passenger: {name: "Adam"}}
            # puts response.body
            assigns(:passenger).name.should eq "Adam"
        end

        it "renders show pnr page" do
            sign_in create(:user)
            get :show_passengers_in_pnr, params: {pnr: create(:pnr_history).pnr_id}
            expect(response).to render_template("show_pnr")

        end

    end
end