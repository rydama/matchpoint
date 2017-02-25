class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end

    add_index :tournaments, :name
  end
end
