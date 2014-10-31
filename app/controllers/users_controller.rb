class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def index
    
  end

  def new
    @user = User.new
  end

  def show
    # stuff?
  end

  def create

    @user = User.new(user_params)
    puts "Creating with #{user_params[:password]}"
    @user.password = user_params[:password]
    @user.save!

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
    # User.authenticate(params[:user], params[:password])
    puts "Login got #{params[:name]} and #{params[:password]}"
    @user = User.find_by_name(params[:name])
    if @user
      if User.authenticate(@user, params[:password])
        # give_token
        session[:user_id] = @user.id
        # render action: 'show', status: 302, location: @user
        redirect_to(user_path(@user))
      else
        redirect_to controller: 'welcome', action: 'index', notice: 'incorrect login.'
      end
    else
      redirect_to controller: 'welcome', action: 'index', notice: 'incorrect login.'
    end
  end

  def logout
    @user = nil
    session[:user_id] = nil
    redirect_to controller: 'welcome', action: 'index', status: 302
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params[:user].permit(:name, :password, :hashed_password)
    end

end
