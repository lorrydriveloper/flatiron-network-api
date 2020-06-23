class Api::V1::CohortsController < ApplicationController 


  def index
    @cohort = Cohort.all
    render json: @cohort
  end
  
end 