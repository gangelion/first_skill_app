class UsersController < ApplicationController
  before_action :set_user_params, only: [:show, :edit, :update, :destroy]
  def index
    @plans = Plan.group(:user_id).order("created_at DESC")
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

  def destroy
    if @user.destroy
      render "users/destroy"
    else
      redierct_back(fallback_location: root_path)
    end
  end

  def delete_confirm
  end

  private

  def user_update_params
    params.require(:user).permit(:name, :image_icon, :introduce)
  end

  def set_user_params
    @user = User.find(params[:id])
  end

end
