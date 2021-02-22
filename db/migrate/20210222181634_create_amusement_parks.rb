class CreateAmusementParks < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_parks do |t|
      t.string :name
      t.decimal :admission_price, precision: 5, scale: 2
    end
  end
end
