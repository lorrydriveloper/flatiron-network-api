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
end

def email_validator
  unless EmailAddress.valid? email
    errors.add(:email, "#{email} is not a valid Email")
   end
 end

def normalize_email
  self.email = email.downcase.strip
end

# User.create(
#   name: 'test1',
#   surname: 'test',
#   email: 'test@hotmail.com',
#   password: '0000',
#   is_admin: true,
#   graduate: false,
#   work_remotely: false
# )
