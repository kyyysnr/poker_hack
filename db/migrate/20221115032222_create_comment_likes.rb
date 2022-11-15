class CreateCommentLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_likes do |t|
      t.integer :comment_id
      t.string :ip

      t.timestamps
    end
  end
end
