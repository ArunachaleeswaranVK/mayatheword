class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.text :token

      t.timestamps null: false
    end
  end
end
