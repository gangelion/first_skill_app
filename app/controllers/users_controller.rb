class UsersController < ApplicationController
  before_action :set_user_params, only: [:show, :edit, :update]
  before_action :set_plan_user_id, only: [:index, :show]
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
  # @plansでプランを全て取得、その後プランを持つユーザーidを@plan_user_idに格納
  # @plan_user_idとcurrent_user.idがイコールになれば（current_userがプランを持っていれば）
  # @plan_user_idを返す
  def set_plan_user_id
    @plans = Plan.all
    @plans.map { |plan|
    @plan_user_id = plan.user_id
    if @plan_user_id == current_user.id
      return @plan_user_id
    end
  }
  end

end
