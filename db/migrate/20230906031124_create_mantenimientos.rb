class CreateMantenimientos < ActiveRecord::Migration[7.0]
  def change
    create_table :mantenimientos do |t|
      t.integer :type_motor
      t.integer :type_mantenimiento
      t.string :motor_name
      t.integer :city
      t.integer :material
      t.datetime :date_mantenimiento
      t.string :user_email
      t.references :user, null: false, foreign_key: true
      t.references :motor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
