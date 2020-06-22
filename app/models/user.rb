class User < ApplicationRecord
  belongs_to :cohort
  has_one :address, as: :addressable
  
end
