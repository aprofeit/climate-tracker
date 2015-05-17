class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.float :humidity, null: false
      t.float :temperature, null: false

      t.timestamps null: false
    end
  end
end
