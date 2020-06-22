class User < ApplicationRecord
  belongs_to :cohort
  belongs_to :company
  has_one :address, as: :addressable
  
end
