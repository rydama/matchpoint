class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.datetime :start_at
      t.references :tournament, index: true, foreign_key: true
      t.references :home_player, index: true, foreign_key: true
      t.references :away_player, index: true, foreign_key: true
      t.timestamps
    end
  end
end
