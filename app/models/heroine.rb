class Heroine < ApplicationRecord
  has_many :powers

  validates :super_name, uniqueness: true
end
