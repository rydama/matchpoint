class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :users, index: true, foreign_key: true
      t.references :tournaments, index: true, foreign_key: true
      t.timestamps
    end
  end
end
