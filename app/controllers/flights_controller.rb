
class FlightsController < ApplicationController
    def book
      @flights = Flight.new
    end

    def index
      @flights = Flight.where(departing:params["flight"][:departing], arriving:params["flight"][:arriving])
      # redirect_to flights_path(@flights)
    end

    def new
        @flight = Flight.new
    end

    def create
        @flight = Flight.new(flight_no:params["flight"][:flight_no], journey_date:params["flight"][:journey_date], arr_time:params["flight"][:arr_time], dep_time:params["flight"][:dep_time],departing:params["flight"][:departing], arriving:params["flight"][:arriving],flight_status:params[:flight_status],seats_available:params["flight"][:seats_available])
        if @flight.save
            redirect_to @flight
        else
            render :new
        end
    end

    def show
        @flight = Flight.find(params[:id])
        # @tickets = @flights.tickets
    end

    # def edit
    #     @flight = Flight.find(params[:id])
    #   end
    
    #   def update
    #     @flight = Flight.find(params[:id])
    #     if @flight.update(flight_params)
    #       redirect_to @flight
    #     else
    #       render :edit
    #     end
    #   end
    
    #   def destroy
    #     @flight = Flight.find(params[:id])
    #     @flight.destroy
    #     redirect_to @flight
    #   end
end

private
    def flight_params
      params.permit(:flight_no, :journey_date, :arr_time, :dep_time,  :departing, :arriving, :flight_status, :seats_available)
    end
