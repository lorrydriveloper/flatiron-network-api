# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  def sign_up
    @user = User.new(user_params)
    @user.address = Address.create(address_params)
    if @user.save
      render json: @user, status :created
    else
      render json: {
        error: 'Unable to save entity',
        message: "#{@user.errors.full_messages.join(', ')} ",
        status: :bad_request
      }
    end
  end

  def login
    @user = User.find_by_email(login_params[:email])

    if @user &&  @user.authenticate(login_params[:password])
      render json: @user
    else
      render json: {
        error: 'Unable to authenticate',
        message: "User or Password is wrong",
        status: :not_acceptable
      }
    end
    

  end

  private

  def user_params
    params.require(:session).permit(:name, :surname, :email, :password, :cohort_id)
  end

  def address_params
    params.require(:session).permit(:plus_code, :street, :postcode, :city,
                                    :country, :state)
  end

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
