class MentorSelectController < ApplicationController
  def index
   @mentor_selects = Mentor.where(language: params[:language])
  end

  def show
    @mentor_selects = Mentor.find(params[:id])
  end
end
