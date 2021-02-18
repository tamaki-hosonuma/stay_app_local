class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    
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
    # if params[:image]
    #   # @room.image_name = "#{@room.id}.jpg"
    #   @room.image_name = "1.jpg"
    #   image = params[:image]
    #   File.binwrite("public/room_images/#{@room.image_name}", image.read)
    # end
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
  end
  
  private
    def room_params
      params.permit(:title, :area, :address, :price, :content, :image_name, :user_id) 
    end

  end