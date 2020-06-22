# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{name: name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_campus(name, location, courses = [])
  Campus.create(name: name) do |u|
    u.address = Address.create(plus_code: location)
    u.courses = courses
  end
end

def create_course(title, description = '')
  Course.create(title: title, description: description)
end

courses = ['Software Engineering', 'Data Science', 'Cybersecurity', 'UX/UI Design']
courses_objects = courses.map { |course| create_course(course) }

campuses = [
  { name: 'Austin Campus', plus_code: '77G4+RW Austin, Texas, United States' },
  { name: 'Chicago Campus', plus_code: 'V9RF+J3 Chicago, Illinois, United States' },
  { name: 'Denver Campus', plus_code: 'Q29G+F9 Denver, Colorado, United States' },
  { name: 'Houston Campus', plus_code: 'QJ5P+JJ Central Business District, Houston, TX, United States' },
  { name: 'New York Manhattan Campus', plus_code: 'PX4P+4C New York, United States' },
  { name: 'New York Brooklyn Campus', plus_code: 'P227+82 Brooklyn, New York, United States' },
  { name: 'San Francisco Campus', plus_code: 'QHFM+X5 SoMa, San Francisco, CA, United States' },
  { name: 'Seattle Campus', plus_code: 'JM57+QF Seattle, Washington, United States' },
  { name: 'Washington, D.C. Campus', plus_code: 'VXX8+4V Washington, District of Columbia, United States' },
  { name: 'London Campus', plus_code: 'GWC6+2X London' },
  { name: 'Online', plus_code: '' }
]

campuses.each{|campus|create_campus(campus[:name], campus[:plus_code], courses_objects)}
  
campus = Campus.find_or_create_by(name:'Online')

course = Course.find_or_create_by(title:'Software Engineering')

cohort = Cohort.create(
  campus:campus, 
  course:course , 
  graduation:Date.new(2020,7), 
  cohort_lead:'Alex Aguilar',
  pace_option:'full_time'
)

user = User.create(
  name: 'Pedro David',
  surname: 'Garcia Lopez',
  email: 'reddevil_cero@hotmail.com',
  password: '0000',
  is_admin: true,
  graduate: false,
  work_remotely: false
)

user.cohort = cohort
user.address = Address.create(plus_code:'MG8V+CV Telford')
user.save
