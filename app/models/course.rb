class Course < ApplicationRecord
  has_many :campus_courses
  has_many :campus, through: :campus_courses
end
