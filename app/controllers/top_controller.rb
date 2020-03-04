class TopController < ApplicationController
  def index
    @plans = Plan.group(:user_id).last(3)
  end

  def mentor_top
  end
end
