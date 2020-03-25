class TopController < ApplicationController
  def index
    @plans = Plan.includes(:user, :skills).group(:user_id).last(6)
    @skill_tags = PlanSkillTag.all
  end

  def mentor_top; end
end
