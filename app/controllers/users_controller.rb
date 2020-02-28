class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_update_params
    params.require(:user).permit(:name, :image_icon, :introduce)
  end
end
