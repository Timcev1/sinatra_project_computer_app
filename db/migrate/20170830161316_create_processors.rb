class CreateProcessors < ActiveRecord::Migration[5.1]
  def change
    create_table :processor do |t|
      t.string :name
      t.integer :speed
    end
  end
end
