class PassengersController < ApplicationController
  def index
    @passengers = Passenger.where(users_id:current_user&.id)
  end

  def show
    @passenger = Passenger.find(params[:id])
    @tickets = @passenger.tickets
  end

  def new
      @passenger = Passenger.new
      @flight = Flight.find_by(id:params["format"])
      
  end

  def create 
    id = current_user.id
    @passenger = Passenger.new(name:params["passenger"][:name], age:params["passenger"][:age], email:params["passenger"][:email], contact:params["passenger"][:contact], users_id: id)
    if @passenger.save
      @passenger.tickets.create(checkin_status:params[:checkin_status], seat_class:params[:seat_class], seat_no:params[:seat_no], luggage:params[:luggage], food:params[:food],passenger_id:@passenger.id, users_id: @passenger.users_id,flights_id:params[:flight_id])
      redirect_to @passenger
    else
      render :new
    end

  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    if @passenger.update(name:params["passenger"][:name], age:params["passenger"][:age], email:params["passenger"][:email], contact:params["passenger"][:contact])
      redirect_to @passenger
    else
      render :edit
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    redirect_to @passenger
  end

private
    def passenger_params
      params.permit(:name, :age, :email, :contact,  :checkin_status, :seat_class, :seat_no, :luggage, :food)
    end
end

