class CreateViewingParties < ActiveRecord::Migration[7.1]
  def change
    create_table :viewing_parties do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :movie, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
