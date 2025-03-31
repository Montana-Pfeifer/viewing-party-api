class CreateInviteeViewingParties < ActiveRecord::Migration[7.1]
  def change
    create_table :invitee_viewing_parties do |t|
      t.references :invitee, null: false, foreign_key: { to_table: :users }
      t.references :viewing_party, null: false, foreign_key: true

      t.timestamps
    end
      add_index :invitee_viewing_parties, [:invitee_id, :viewing_party_id], unique: true
  end 
end
