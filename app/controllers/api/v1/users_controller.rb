# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params) &&
       @user.update_attributes(social_params) &&
       @user.address.update_attributes(address_params)
      render json: { user: UserSerializer.new(@user) }, status: :accepted

    else
      render json: {
        error: 'Unable to save entity',
        message: "#{@user.errors.full_messages.join(', ')} ",
        status: :bad_request
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email)
  end

  def address_params
    params.require(:location).permit(:plus_code, :street, :postcode, :city,
                                     :country, :state, :latitude, :longitude)
  end

  def social_params
    params.require(:social).permit(:github, :twitter, :linkedIn, :facebook, :instagram, :blog, :portfolio)
  end

  def check_lat(address_params); end
end
