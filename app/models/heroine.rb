class Heroine < ApplicationRecord
  has_one :power
  validates :super_name, uniqueness: true
  validates :power_id, presence: true

end
