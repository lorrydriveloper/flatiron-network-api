class Api::V1::CohortsController < ApplicationController 

  skip_before_action :authorized, only: [:index]

  def index
    @cohort = Cohort.all
    render json: @cohort
  end
  
end 