class CreateMotors < ActiveRecord::Migration[7.0]
  def change
    create_table :motors do |t|
      t.integer :type_motor
      t.string :name
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
