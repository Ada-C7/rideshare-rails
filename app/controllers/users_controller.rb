class UsersController < ApplicationController

def index
  @users = User.all
end

def create
  @user = User.create user_params #params[:user]

  if @user.id != nil
    redirect_to #users_path
  else
    render "new"
  end
end

def new
  @user = User.new
end

def edit
  @user = User.find(params[:id])
end

def show
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.udpate(user_params)
    redirect_to #user_path
  else
    render "edit"
  end
end

def destroy
  user.destroy(params[:id])
  redirect_to #users_path
end

end
