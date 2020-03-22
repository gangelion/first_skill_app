class SkillsController < ApplicationController
  def index
    @skill = Skill.find(params[:id])
    @skills = Skill.first(8)
    @plans = Skill.find(params[:id]).plans.group(:user_id).includes(:user).page(params[:page]).per(10)
  end
end
