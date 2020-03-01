class PlansController < ApplicationController
  before_action :set_plan_params, only: [:show, :edit, :update, :destroy]
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
    @plan.skills.build
  end

  def create
    plan = Plan.new(plan_params)
    plan.user_id = current_user.id
    if plan.save
      redirect_to users_path
    else
      redirect_back(fallback_location: root_path)
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
      redierct_back(fallback_location: root_path)
    end
  end

  def destroy
    if @plan.destroy
      render "plans/destroy"
    else
      redierct_back(fallback_location: root_path)
    end
  end

  private
  
  def plan_params
    params.require(:plan).permit(:title, :description, :plan_image, :price, :user_id, skill_ids: [])
  end

  def set_plan_params
    @plan = Plan.find(params[:id])
  end
end
