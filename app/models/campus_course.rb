class CampusCourse < ApplicationRecord
  belongs_to :campus
  belongs_to :course
end
