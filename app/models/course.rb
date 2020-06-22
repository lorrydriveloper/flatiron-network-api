class Course < ApplicationRecord
  has_many :campus, through: :campus_courses
end
