class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
    @tickets = @passenger.tickets
  end

  def new
      @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(name:params["passenger"][:name], age:params["passenger"][:age], email:params["passenger"][:email], contact:params["passenger"][:contact])
    @passenger2 = Passenger.find_by(email:params["passenger"][:email])
    if @passenger2 != nil
        @passenger2.tickets.create(checkin_status:params[:checkin_status], seat_class:params[:seat_class], seat_no:params[:seat_no], luggage:params[:luggage], food:params[:food], total_cost:params["passenger"][:total_cost],passenger_id:@passenger2.id)
        redirect_to @passenger2

    else
      if @passenger.save
        puts  @passenger.id
        @passenger.tickets.create(checkin_status:params[:checkin_status], seat_class:params[:seat_class], seat_no:params[:seat_no], luggage:params[:luggage], food:params[:food], total_cost:params["passenger"][:total_cost],passenger_id:@passenger.id)
        redirect_to @passenger
      else
      render :new
      end
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
    @passenger.destroy
    redirect_to @passenger
  end

private
    def passenger_params
      params.require(:passenger).permit(:name, :age, :email, :contact,  :checkin_status, :seat_class, :seat_no, :luggage, :food, :total_cost)
    end
end

