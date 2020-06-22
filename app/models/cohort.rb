class Cohort < ApplicationRecord
  has_many :users
  belongs_to :campus
  belongs_to :course
end
