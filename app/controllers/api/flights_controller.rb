class Api::FlightsController < ApplicationController
  def index
    @flights = Flight.where(departing:params[:departing], arriving:params[:arriving])
    render json: @flights, status: 200
  end
end
