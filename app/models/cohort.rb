class Cohort < ApplicationRecord
  belongs_to :userId
  belongs_to :campusId
  belongs_to :courseId
end
