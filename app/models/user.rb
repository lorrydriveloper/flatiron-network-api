# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  belongs_to :cohort
  belongs_to :company, optional: true
  has_one :address, as: :addressable
  validates :email, presence: true, uniqueness: true
  before_validation :normalize_email
  validate :email_validator
  validates_associated :address

  def email_validator
    unless EmailAddress.valid? email
      errors.add(:email, "#{email} is not a valid Email")
     end
  end

  def normalize_email
    self.email = email.downcase.strip
  end

  def update_from_api(params)
    user_params = params.require(:user).permit(:name, :surname, :email)
    address_params = params.require(:location).permit(:street, :postcode, :city,
                                                      :country, :state, :latitude, :longitude)
    social_params =  params.require(:social).permit(:github, :twitter, :linkedIn, :facebook, :instagram, :blog, :portfolio)

    update_attributes(user_params) &&
      update_attributes(social_params) &&
      address.update_attributes(address_params)
  end
end
