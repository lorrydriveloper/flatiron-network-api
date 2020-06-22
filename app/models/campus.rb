class Campus < ApplicationRecord
  has_many :campus_courses
  has_many :courses, through: :campus_courses
end
