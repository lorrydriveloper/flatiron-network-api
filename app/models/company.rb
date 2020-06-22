class Company < ApplicationRecord
  has_many :users
  has_many :addresses, as: :addressable
end
