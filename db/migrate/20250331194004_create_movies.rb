class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :vote_average
      t.string :description
      t.date :release_date
      t.string :poster_url

      t.timestamps
    end
  end
end
