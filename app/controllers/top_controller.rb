class TopController < ApplicationController
  def index
    @plans = Plan.all.last(3)
  end

  def mentor_top
  end
end
