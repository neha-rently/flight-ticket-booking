class PassengersController < ApplicationController
  def index
    @passengers = Passenger.where(users_id:current_user&.id)
  end

  def show
    @passenger = Passenger.find(params[:id])
    @tickets = @passenger.tickets
  end

  def new
    if params[:pid] != ""
      @passenger = Passenger.find(params[:pid])
    else
      @passenger = Passenger.new
    end
      @flight = Flight.find_by(id:params["id"])
      
  end

  def create 
      @flight = Flight.find_by(id:params[:flight_id])
      if params[:seat_class]=="Economy"
        cost = @flight.economy
      else
        cost = @flight.business
      end
        
      if params[:luggage]=="5 Kgs"
        luggage_cost = 5000
      elsif params[:luggage]=="10 Kgs"
        luggage_cost = 10000
      elsif params[:luggage]=="15 Kgs"
        luggage_cost = 15000
      else
        luggage_cost = 0
      end

      if params[:food]=="Veg"
        food_cost = 350
      elsif params[:food]=="Non-Veg"
        food_cost = 500
      else
        food_cost = 0
      end

      x=2

      @exists = Passenger.find_by(email:params["passenger"][:email])
      if @exists == nil
        @passenger = Passenger.new(name:params["passenger"][:name], age:params["passenger"][:age], email:params["passenger"][:email], contact:params["passenger"][:contact], users_id: current_user.id)
        if @passenger.save
          @passenger.tickets.create(checkin_status:params[:checkin_status], seat_class:params[:seat_class], luggage:params[:luggage], food:params[:food],passenger_id:@passenger.id, users_id: @passenger.users_id,flights_id:params[:flight_id],cost:cost+luggage_cost+food_cost)
        end
        if @flight.update(seats_available:@flight.seats_available-1)
          redirect_to 
        else
          render :new
        end
      else
        @exists.tickets.create(checkin_status:params[:checkin_status], seat_class:params[:seat_class], luggage:params[:luggage], food:params[:food],passenger_id:@exists.id, users_id: @exists.users_id,flights_id:params[:flight_id],cost:cost+luggage_cost+food_cost)
        if @flight.update(seats_available:@flight.seats_available-1)
          redirect_to @exists
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
      params.permit(:name, :age, :email, :contact,  :checkin_status, :seat_class, :luggage, :food)
    end
end

