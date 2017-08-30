class CreateComputer < ActiveRecord::Migration[5.1]
  def change
    create_table :computer do |t|
      t.string :name
      t.integer :processor_id
      t.integer :graphic_id
    end
  end
end
