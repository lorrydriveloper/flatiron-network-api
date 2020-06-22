class Campus < ApplicationRecord
  has_many :courses, through: :campus_courses
end
