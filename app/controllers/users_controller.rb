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
    @user.password = user_params[:hased_password]
    @user.save!

    respond_to do |format|
      if @user.save
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
    @user = User.find_by_name(params[:name])
    if @user
      if @user.password == params[:hashed_password]
        # give_token
        session[:user_id] = @user.id
        # why does this not work? :(
        # redirect_to controller: 'users', action: 'show'
      end
    else
      redirect_to controller: 'welcome', action: 'index', notice: 'incorrect login.', status: 303
    end
  end

  def logout
    if @user
      @user.password = nil
    end
    session[:user_id] = nil
    redirect_to controller: 'welcome', action: 'index', status: 302
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params[:user].permit(:name, :hashed_password)
    end

end
