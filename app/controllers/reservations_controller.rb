class ReservationsController < ApplicationController
  def new
    @room = Room.find_by(params[:room_id])
    @reservation = Reservation.new
    # @reservation[:room_id] = params[:room.id]
    # @name = current_user.name
  end



  def index
    @reservations = Reservation.all
    @room = Room.find_by(params[:room_id])
  end

  def create
    @room = Room.find_by(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    # render :new and return if params[:back] || !@reservation.save
  
    if @reservation.save
      flash[:notice] = "予約完了しました"
      redirect_to("/reservations/index")
    else
      render("reservations/new")
    end

  end



  # def confirm
  #   @reservation = Reservation.new(reservation_params)
  #   render :new if @user.invalid?
  # end

  private
  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id,:start, :end, :num_people ) 
  end

end

