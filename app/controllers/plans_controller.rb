class PlansController < ApplicationController
  def new
    @plan = Plan.new
    @plan.skills.build
  end

  def create
   plan = Plan.new(plan_params)
   plan.user_id = current_user.id
    if plan.save
      redirect_to main_index_path
    else
      redirect_back(fallback_location: root_path)
    end   
  end
end


private

def plan_params
  params.require(:plan).permit(:title, :description, :plan_image, :price, :user_id, skill_ids: [])
end
