# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end
end
