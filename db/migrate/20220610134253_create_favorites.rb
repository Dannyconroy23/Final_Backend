class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :character, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :imageUrl
      

      t.timestamps
    end
  end
end
