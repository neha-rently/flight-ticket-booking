class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
      @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(name:params["passenger"][:name], age:params["passenger"][:age], email:params["passenger"][:email], contact:params["passenger"][:contact])
    if @passenger.save
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

    if @passenger.update(passenger_params)
      redirect_to @passenger
    else
      render :edit
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy!

    redirect_to root_path
  end

private
    def passenger_params
      params.require(:passenger).permit(:name, :age, :email, :contact)
    end
end

