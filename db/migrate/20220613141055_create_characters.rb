class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table(:characters, id: false) do |t|
      t.integer :id, null: false, primary_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :imageUrl  

      t.timestamps
    end
  end
end
