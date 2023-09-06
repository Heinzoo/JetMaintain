class Mantenimiento < ApplicationRecord
  belongs_to :user
  belongs_to :motor
  validates :type_motor, :type_mantenimiento, :motor_name, :city, :material, 
            :date_mantenimiento, :user_email, :user_id, :motor_id, presence: true
  enum :type_mantenimiento, ['Preventivo', 'Correctivo']
  enum :city, ['Santiago de Chile', 'Temuco', 'Antofagasta']
  enum :material, ['Turbinas', 'Sistemas de ignición', 'Sistemas de combustible']
end
