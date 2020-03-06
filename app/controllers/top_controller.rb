class TopController < ApplicationController
  def index
    @plans = Plan.includes(:user).group(:user_id).last(3)
  end

  def mentor_top
  end
end
