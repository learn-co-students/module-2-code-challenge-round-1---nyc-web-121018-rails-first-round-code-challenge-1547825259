class Power < ApplicationRecord

has_many :heroines

  validates :power, uniqueness: :true

end
