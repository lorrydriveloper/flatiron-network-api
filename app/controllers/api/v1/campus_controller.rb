# frozen_string_literal: true

class Api::V1::CampusController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @campus = Campus.all

    render json: @campus
  end
end
