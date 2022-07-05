
class FlightsController < ApplicationController


    def index
        @flights = Flight.all
        if params.has_key?(:count)
            @flights = @flights.filter_by_count(params[:count])
        end
        if params.has_key?(:departing)
            @flights = @flights.filter_by_departing(params[:departing])
        end
        if params.has_key?(:arriving)
            @flights = @flights.filter_by_arriving(params[:arriving])
        end
        if params.has_key?(:journey_date)
            @flights = @flights.filter_by_date(params[:journey_date])
        end
        if params.has_key?(:price) && params[:price] != "0"
            @flights = @flights.filter_by_price(params[:price])
        end
        @departing = Flight.select(:departing).distinct
        @arriving = Flight.select(:arriving).distinct
    end

    def show
        @flight = Flight.find(params[:id])
    end

end
