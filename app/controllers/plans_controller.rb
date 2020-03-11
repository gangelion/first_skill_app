class PlansController < ApplicationController
  before_action :set_plan_params, only: [:show, :edit, :update, :destroy]
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
    @plan.users_plans.new
    @plan.skills.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      redirect_to users_path
    else
      render :new
    end   
  end

  def show
    @user = Plan.find(params[:id]).user
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    if @plan.destroy
      render :destroy
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def all_mentor
    @plans = Plan.includes(:user, :skills).group(:user_id).page(params[:page]).per(5)
  end

  def new_arrival_mentor
    @plans = Plan.includes(:user, :skills).group(:user_id).order("created_at DESC").page(params[:page]).per(5)
  end

  def search
    @plans = Plan.search(params[:keyword]).includes(:user).group(:user_id).page(params[:page]).per(5)
  end

  private
  
  def plan_params
    params.require(:plan).permit(:title, :description, :plan_image, :price, :user_id, users_plans_attributes: [:user_id], skills_attributes: [:skill_set])
  end

  def set_plan_params
    @plan = Plan.find(params[:id])
  end
end
