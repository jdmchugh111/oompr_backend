class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.string :user_id
      t.string :listing_id
      t.string :picture
      t.string :price
      t.string :address

      t.timestamps
    end
  end
end
