class DelCommentToPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :post_comment, :string
  end
end
