class Mantenimiento < ApplicationRecord
  belongs_to :user
  belongs_to :motor
end
