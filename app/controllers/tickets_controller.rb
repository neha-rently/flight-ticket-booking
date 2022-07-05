class TicketsController < ApplicationController
  def index
    @tickets = Ticket.where(passenger_id:params["format"])
  end

  def show
    @ticket = Ticket.find(params[:id])
    @pnr = PnrHistory.find_by(ticket_id:params[:id])

  end

  private
    def ticket_params
      params.permit(:checkin_status, :seat_class, :luggage, :food)
    end
end
