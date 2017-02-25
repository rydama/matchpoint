class AddUserRefToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_reference :tournaments, :owner, references: :users, index: true
    add_foreign_key :tournaments, :users, column: :owner_id
  end
end
