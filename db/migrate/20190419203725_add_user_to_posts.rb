class AddUserToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, foreign_key: true
    remove_column :comments, :username

  end
end
