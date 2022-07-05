class Api::FlightsController < Api::ApplicationController
  def index
    @flights = Flight.all
    render json: {flights:@flights}, status: 200
  end

  def show
    @flight = Flight.where(id:params[:id])
    render json: @flight, status: 200
  end

  def create
    begin
      @flight = Flight.create!(flight_params)
      if @flight.save
        render json: @flight, status: 200
      else
        render json: {error: "Error Occured"}, status: 400
      end
    rescue => exception
      puts exception
      render json: {error: exception},status:400
    end
  end

  def update
    begin
      @flight = Flight.find(params[:id])
      if @flight.update(flight_params)
        render json: @flight, status: 200
      else
        render json: {error: "Error Occured"}, status: 400
      end
    rescue => exception
      render json: {error: exception}
    end
  end

  def destroy
    begin
      @flight = Flight.find(params[:id])
      if @flight.destroy
        render json: @flight, status: 200
      else
        render json: {error: "Error Occured"}, status: 400
      end
    rescue => exception
      render json: {error: exception}
    end
  end

  def flight_params
    params.require(:flight).permit(:flight_no, :journey_date, :arr_time, :dep_time, :departing, :arriving, :flight_status, :seats_available, :economy, :business)
  end

end

