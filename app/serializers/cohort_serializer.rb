# frozen_string_literal: true

class CohortSerializer < ActiveModel::Serializer
  attributes :id, :cohort_lead, :campus, :course, :graduation

  def campus
    object.campus.name
  end

  def course
    object.course.title
  end
end
