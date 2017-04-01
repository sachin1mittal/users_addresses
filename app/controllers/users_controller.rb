class UsersController < ApplicationController
  def index
    @users = User.includes(:active_address)
  end

  def new
    @user = User.new
    @address = @user.addresses.build
  end

  def edit
    user.addresses.build
    @addresses = user.addresses
  end

  def create
    @user = User.new(user_params)
    @user.save!
    flash[:notice] = 'User Successfully Created'
    redirect_to users_path
  end

  def update
    user.update_attributes!(user_params)
    flash[:notice] = 'User Successfully Updated'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, addresses_attributes: [:id, :full_address, :active])
  end

  def user
    @user ||= User.find(params[:id])
  end
end
