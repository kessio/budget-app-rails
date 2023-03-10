class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :icon, default: 'https://unsplash.com/photos/JZs-_xFIDV0'
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
