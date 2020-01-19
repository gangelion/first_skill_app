class Mentors::MainController < ApplicationController
  def index

  end

  def create
    @mentor = Mentor.new
    @mentors = Mentor.create(language_params)
    if @mentors.save
      redirect_to root_path, :notice => "Foo saved"
    else
      root_path
    end
  end


  private

  def language_params
    params.permit(:language)
  end
end
