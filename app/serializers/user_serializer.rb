# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :email, :password_digest,
             :is_admin, :graduate, :cohort, :address, :company, :social

  def address
    if object.address
      {
        latitude: object.address.latitude,
        longitude: object.address.longitude
      }
    end
  end

  def campus
    {
      id: object.cohort.campus.id,
      name: object.cohort.campus.name
    }
  end

  def course
    {
      id: object.cohort.course.id,
      title: object.cohort.course.title,
      description: object.cohort.course.description
    }
  end

  def cohort
    {
      id: object.cohort.id,
      cohort_lead: object.cohort.cohort_lead,
      graduation: object.cohort.graduation,
      pace_option: object.cohort.pace_option,
      campus: campus,
      course: course

    }
  end

  def company
    if object.company
      {
        id: object.company.id,
        name: object.company.name,
        logo: object.company.logo
      }
    else
      object.graduate ? 'Job seeker' : 'Still Studing'
    end
  end

  def social
    {
      facebook: object.facebook,
      twitter: object.twitter,
      linkedIn: object.linkedIn,
      blog: object.blog,
      portfolio: object.portfolio,
      instragram: object.instragram
    }
  end
end
