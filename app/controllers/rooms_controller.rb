class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :authenticate_user, only: [:edit, :show, :new, :create, :update, :destroy]

 
  def index
    @q = Room.search(params[:q])
    @rooms = @q.result
  end


  def show
    @room = Room.find_by(id: params[:id])
  end

  def edit
    @room = Room.find_by(id: params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = @current_user.id
    @room.image_name = "default-room.jpg"
    if @room.save
      flash[:notice] = "登録完了しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render("rooms/new")
    end
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.title = params[:title]
    @room.area = params[:area]
    @room.address = params[:address]
    @room.price = params[:price]
    @room.content = params[:content]
    if params[:image]
      @room.image_name = "#{@room.id}.jpg"
      image = params[:image]
      File.binwrite("public/room_images/#{@room.image_name}", image.read)
    end
    if @room.save
      flash[:notice] = "情報を更新しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render("rooms/edit")
    end
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    redirect_to("/rooms/index")
  end

  def search
    @rooms = Room.search(params[:search])
    @results = @q.result
    
  end
  
  private
    def room_params
      params.permit(:title, :area, :address, :price, :content, :image_name, :user_id) 
    end

    def set_q
      @q = Room.ransack(params[:q])
    end

  end