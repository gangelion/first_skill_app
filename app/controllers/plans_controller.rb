class PlansController < ApplicationController
  before_action :set_plan_params, only: %i[show edit update destroy]
  def index
    @plans = Plan.where(user_id: current_user.id)
    @skills = Skill.first(8)
  end

  def new
    @plan = Plan.new
    @plan.skills.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to users_path, notice: "プランを登録しました"
    else
      flash.now[:alert] = "プランの登録に失敗しました"
      render :new
    end
  end

  def show
    @user = Plan.find(params[:id]).user
  end

  def edit
    @plan.skills.new
  end

  def update
    if @plan.update(plan_params)
      redirect_to users_path, notice: "プランを更新しました"
    else
      flash.now[:alert] = "プランの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @plan.destroy
      render :destroy
    else
      flash.now[:alert] = "プランの削除に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def all_mentor
    @plans = Plan.includes(:user, :skills).group(:user_id).page(params[:page]).per(10)
  end

  def new_arrival_mentor
    @plans = Plan.includes(:user, :skills).group(:user_id).order("created_at DESC").page(params[:page]).per(10)
  end

  def search
    if Plan.search(params[:keyword]).nil?
      redirect_back(fallback_location: root_path)
    else
      @plans = Plan.search(params[:keyword]).includes(:user).group(:user_id).page(params[:page]).per(10)
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :description, :plan_image, :price, skills_attributes: [:skill_set]).merge(user_id: current_user.id)
  end

  def set_plan_params
    @plan = Plan.find(params[:id])
  end
end
