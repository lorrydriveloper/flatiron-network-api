# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_from_api(params)
      render json: { user: UserSerializer.new(@user) }, status: :accepted
    else
      render json: {
        error: 'Unable to save entity',
        message: "#{@user.errors.full_messages.join(', ')} ",
        status: :bad_request
      }
    end
  end
end
