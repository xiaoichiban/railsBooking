class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.integer :capacity
      t.integer :whiteboard
      t.boolean :conferencing

      t.timestamps
    end
  end
end
