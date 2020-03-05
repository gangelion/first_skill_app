class SkillsController < ApplicationController
  def index
    @skill = Skill.find(params[:id])
    @skills = PlanSkillTag.where(skill_id: params[:id]).page(params[:page]).per(5)
  end
end
