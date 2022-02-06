class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|

      t.references :user, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true

      t.timestamps
    end
  end
end
