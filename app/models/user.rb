# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  belongs_to :cohort
  belongs_to :company
  has_one :address, as: :addressable
end

User.create(
  name: 'Pedro David',
  surname: 'Garcia Lopez',
  email: 'reddevil_cero@hotmail.com',
  password: '0000',
  is_admin: true,
  graduate: false,
  work_remotely: false
)
