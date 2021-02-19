class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_q
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
    @user_image = @current_user
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/top")
    end
  end
end
