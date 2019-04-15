class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :caption
      t.integer :rating
      t.string :location
      t.string :time
      t.text :tags
      t.string :username
      t.timestamps
    end
  end
end
