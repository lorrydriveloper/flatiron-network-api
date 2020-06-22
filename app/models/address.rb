class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  before_validation :geocode
  geocoded_by :find_me
  # validates :street, :city, :postcode, :country, presence: true
  validates :latitude, presence: {
    message: 'sorry unable to Geolocate that address try a more general one'
  }
  
  # TODO: reverse geocoding when plus_code is used
  
  # reverse_geocoded_by :latitude, :longitude do |obj, results| 
  #   if geo = results.first

  #     obj.street = geo.street
  #     obj.city = geo.city
  #     obj.postcode = geo.postcode
  #   end
  # end
  # after_validation :reverse_geocode,if: :plus_code


  # def reverse_geocode
  # TODO: The only consistend return is formated address
  #   pry
  # end


  def find_me
    plus_code || [street, city, postcode, state, country].compact.join(', ')
  end
end


# Address.create(street:'Parkland ave',city:'Telford','postcode':'TF42EU',country:'United Kindom')
# Address.create(plus_code:'PH22+6X Málaga, Spain'),street:'Parkland ave',city:'Telford','postcode':'TF42EU',country:'United Kindom')
# Address.create(plus_code:'MG8V+CV Telford')
