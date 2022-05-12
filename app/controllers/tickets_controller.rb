class TicketsController < ApplicationController
  def index
    @tickets = Ticket.where(passenger_id:params["format"])
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to passenger_path(@ticket.passenger_id)
  end

  private
    def ticket_params
      params.permit(:checkin_status, :seat_class, :seat_no, :luggage, :food)
    end
end
