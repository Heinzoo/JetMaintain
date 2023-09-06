class Motor < ApplicationRecord
  has_many :mantenimiento
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  enum :type_motor, ['Motor a reacción', 'Motor a turbohélice']
end
