class PassengersController < ApplicationController
  before_action :check, on: [:index, :show, :create_pnr, :new, :edit, :show_passengers_in_pnr]

  def index
    @passengers = Passenger.where(users_id:current_user&.id)
  end

  def show
    @passenger = Passenger.find(params[:id])
    @tickets = @passenger.tickets
  end

  def create_pnr
    @pnr = Pnr.create(booking_date:Date.today, user_id:current_user.id,count:params[:count])
    if params.has_key?(:pid)
      redirect_to "/passengers/new/#{params[:id]}?pid=#{params[:pid]}&count=1&pnr=#{@pnr.id}"
    else
      redirect_to "/passengers/new/#{params[:id]}?count=#{params[:count]}&pnr=#{@pnr.id}"
    end
  end

  def new
    if params.has_key?(:pid)
      @passenger = Passenger.find(params[:pid])
    else
      @passenger = Passenger.new
    end
      @flight = Flight.find_by(id:params["id"])
      @pnr = Pnr.find_by(id:params["pnr"])
      
  end

  def create 
      count = 1
      @users = JSON.parse(params[:passenger][:actual_users])
      users = @users["actual_users"].count
      @users["actual_users"].each do |user|
        @flight = Flight.find_by(id:params[:flight_id])
        if user["seat_class"]=="Economy"
          cost = @flight.economy
        else
          cost = @flight.business
        end
          
        if user["luggage"]=="5 Kgs"
          luggage_cost = 5000
        elsif user["luggage"]=="10 Kgs"
          luggage_cost = 10000
        elsif user["luggage"]=="15 Kgs"
          luggage_cost = 15000
        else
          luggage_cost = 0
        end

        if user["food"]=="Veg"
          food_cost = 350
        elsif user["food"]=="Non-Veg"
          food_cost = 500
        else
          food_cost = 0
        end
        @exists = Passenger.find_by(email:user["email"])
        if @exists == nil
          @passenger = Passenger.new(name:user["name"], age:user["age"], email:user["email"], contact:user["contact"], users_id: current_user.id)
          if @passenger.save
            @ticket = @passenger.tickets.create(checkin_status:user["checkin_status"], seat_class:user["seat_class"], luggage:user["luggage"], food:user["food"],passenger_id:@passenger.id, users_id: @passenger.users_id,flights_id:params[:flight_id],cost:cost+luggage_cost+food_cost)
            @pnr = PnrHistory.create(pnr_id:params[:pnr],ticket_id:@ticket.id)
            @flight.update(seats_available:@flight.seats_available-1)
          end
        else
          @ticket = @exists.tickets.create(checkin_status:user["checkin_status"], seat_class:user["seat_class"], luggage:user["luggage"], food:user["food"],passenger_id:@exists.id, users_id: @exists.users_id,flights_id:params[:flight_id],cost:cost+luggage_cost+food_cost)
          @pnr = PnrHistory.create(pnr_id:params[:pnr],ticket_id:@ticket.id)
          @flight.update(seats_available:@flight.seats_available-1)
        end
      end
      return redirect_to "/passengers/pnr/#{params[:pnr]}"
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


  def show_passengers_in_pnr 
    @pnr_histories = PnrHistory.where(pnr_id:params[:pnr])
    @tickets = []
    @passengers=[]
    @pnr_histories.each do |pnr_history|
      @tickets.append(pnr_history.ticket)
    end
    @tickets.each do |ticket|
      @passengers.append(ticket.passenger)
    end
    @pnr = params[:pnr]
    render :show_pnr
  end

private
    def passenger_params
      params.permit(:name, :age, :email, :contact,  :checkin_status, :seat_class, :luggage, :food)
    end

    def check
      if !user_signed_in?
        redirect_to "/users/sign_in"
      end
    end
end

