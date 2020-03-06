class SkillsController < ApplicationController
  def index
    @skill = Skill.find(params[:id])
    @skills = Skill.find(params[:id]).plans.group(:user_id).page(params[:page]).per(5)
  end
end
