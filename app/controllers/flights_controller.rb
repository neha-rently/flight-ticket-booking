
class FlightsController < ApplicationController
    def book
      @flights = Flight.new
    end

    def index
        @flights = Flight.all
        if params.has_key?(:departing)
            @flights = @flights.filter_by_departing(params[:departing])
        end
        if params.has_key?(:arriving)
            @flights = @flights.filter_by_arriving(params[:arriving])
        end
        if params.has_key?(:journey_date)
            @flights = @flights.filter_by_date(params[:journey_date])
        end
        if params.has_key?(:price)
            @flights = @flights.filter_by_price(params[:price])
        end
        # if params.has_key?(:price) && params[:price].to_i != 0
        #     @products = @products.filter_by_price(params[:price])
        # end
        @departing = Flight.select(:departing).distinct
        @arriving = Flight.select(:arriving).distinct
        puts "HELOOOOOOOOOOO"
        puts @departing
        puts params
      # redirect_to flights_path(@flights)
    end

    def new
        @flight = Flight.new
    end

    def create
        @flight = Flight.new(flight_params)
        puts "ffffffffffffff"
        puts params
        if @flight.save
            redirect_to @flight
        else
            render :new
        end
    end

    def show
        puts "jjjjjjjjj"
        puts params
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
      params.permit(:flight_no, :journey_date, :arr_time, :dep_time,  :departing, :arriving, :flight_status, :seats_available, :economy, :business)
    end
