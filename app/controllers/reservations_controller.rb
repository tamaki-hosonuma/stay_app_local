class ReservationsController < ApplicationController
  before_action :authenticate_user
  
  def new
    @room = Room.find_by(params[:room_id])
    @reservation = Reservation.new
 
  end

  def back
    @room = Room.find_by(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    render("reservations/new")
  end

  def confirm
    @room = Room.find_by(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      render("reservations/new")
    end
  end


  def index
    @reservations = Reservation.all
    @current_reservations = Reservation.where(user_id: @current_user)
    @room = Room.find_by(params[:room_id])
  end

  def create
    @room = Room.find_by(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約完了しました"
      redirect_to("/reservations/index")
    else
      render("reservations/new")
    end

  end

  private
  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id,:start, :end, :num_people ) 
  end

end

