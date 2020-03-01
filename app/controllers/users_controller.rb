class UsersController < ApplicationController
  before_action :set_user_params, only: [:show, :edit, :update]
  def index
  end

  def show
  end

  def edit
  end

  def update
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

  def set_user_params
    @user = User.find(params[:id])
  end

end
