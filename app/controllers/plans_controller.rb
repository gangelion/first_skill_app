class PlansController < ApplicationController
  before_action :set_plan_params, only: [:show, :edit, :update, :destroy]
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
    @plan.users_plans.new
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
      render "plans/destroy"
    else
      redierct_back(fallback_location: root_path)
    end
  end

  def all_mentor
    @plans = Plan.group(:user_id)
  end

  def new_arrival_mentor
    @plans = Plan.group(:user_id).reverse
  end
  private
  
  def plan_params
    params.require(:plan).permit(:title, :description, :plan_image, :price, :user_id, users_plans_attributes: [:user_id], skill_ids: [])
  end

  def set_plan_params
    @plan = Plan.find(params[:id])
  end
end
