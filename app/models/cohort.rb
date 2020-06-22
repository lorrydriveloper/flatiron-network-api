class Cohort < ApplicationRecord
  has_many :users
  belongs_to :campus
  belongs_to :course
end


# campus = Campus.find_or_create_by(name:'Online')

# course = Course.create(title:'Software Engineering', description:'FullStack Dev')
# course.campus = campus

# Cohort.create(campus:campus, course:course , graduation:Date.new(2020,7), cohort_lead:'Alex')