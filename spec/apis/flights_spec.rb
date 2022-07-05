require 'rails_helper'

RSpec.describe "Flights", :type => :request do
    context "unauthorized user" do
        it "fails with HTTP 401" do
            get "/api/flights"
            expect(response).to have_http_status(:unauthorized)
        end
    end

    context "authorized user" do
        let(:application){FactoryBot.create(:application)}
        let(:user){FactoryBot.create(:user)}
        let(:token) {FactoryBot.create(:access_token, application:application,resource_owner_id: user.id)}

        it "returns all flight details" do
            flight = create(:flight)
            get "/api/flights", headers: {"Authorization": "Bearer "+token.token}
            result = JSON.parse(response.body)
            expect(response).to have_http_status(200)
            
        end

        it "returns particular flight details" do
            flight = create(:flight)
            get "/api/flights",params: {id: flight.id}, headers: {"Authorization": "Bearer "+token.token}
            expect(response).to have_http_status(200)
            
        end

        it "creates a new flight" do
            expect{ post "/api/flights", params: {flight: {flight_no: "F990",journey_date: "2022-10-06",arr_time: "15:50",dep_time: "13:20",departing: "Chennai",arriving: "Delhi",flight_status: "On Time",seats_available: 200,economy: 3700,business: 7900}}, headers: { 'Authorization': 'Bearer ' + token.token }}.to change(Flight, :count).by(1)
            expect(response).to have_http_status(200)
        end

        it "updates flight details successfully" do
            flight = create(:flight)
            put "/api/flights/#{flight.id}", params: {flight: {flight_no: "A127"}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end

        it "deletes a flight successfully" do
            flight = create(:flight)
            delete "/api/flights/#{flight.id}", params: {}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end
    end
end