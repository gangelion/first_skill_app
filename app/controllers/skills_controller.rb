class SkillsController < ApplicationController
  def index
    @skill = Skill.find(params[:id])
    @skills = PlanSkillTag.where(skill_id: params[:id])
  end
end
