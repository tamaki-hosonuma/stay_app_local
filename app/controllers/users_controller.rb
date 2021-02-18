class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: [:show,:edit, :update]}

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def login_form
  end


  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user 
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @name = params[:name]
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default-user.jpg"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
    
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.email = params[:email]
    @user.password = params[:password]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
  
    if @user.save
      flash[:notice] = "情報を更新しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :image_name)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/index")
    end
  end
  

end
