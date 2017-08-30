class CreateComputer < ActiveRecord::Migration[5.1]
  def change
    create_table :computer do |t|
      t.string :name
      t.string :processor
      t.integer :processor_speed
      t.string :graphics_card
    end
  end
end
