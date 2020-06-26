class Api::V1::CoursesController < ApplicationController 

  skip_before_action :authorized, only: [:index]

  def index
    @course = Course.all
    render json: @course
  end
  
end 