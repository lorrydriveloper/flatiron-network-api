# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  belongs_to :cohort
  belongs_to :company, optional: true
  has_one :address, as: :addressable
  validates :address, presence: {
    message: 'No Address provided'
  }
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
