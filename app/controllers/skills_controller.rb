class SkillsController < ApplicationController
  def index
    @skill = Skill.find(params[:id])
    @plans = Skill.find(params[:id]).plans.group(:user_id).includes(:user).page(params[:page]).per(5)
  end
end
