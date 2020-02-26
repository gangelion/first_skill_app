class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
   plan = Plan.new(plan_params)
    if plan.save
      redirect_to main_index_path
    else
      redirect_back(fallback_location: root_path)
    end   
  end
end


private

def plan_params
  params.require(:plan).permit(:title, :description, :plan_image, :price)
end