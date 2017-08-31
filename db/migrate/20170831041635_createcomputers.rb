class Createcomputers < ActiveRecord::Migration[5.1]
  def change
    create_table :computers do |t|
      t.string :name
      t.string :processor
      t.integer :processor_speed
      t.string :graphics_card
    end
  end
end
