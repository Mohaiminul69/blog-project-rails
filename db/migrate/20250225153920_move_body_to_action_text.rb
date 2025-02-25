class MoveBodyToActionText < ActiveRecord::Migration[8.0]
  def change
    BlogPost.all.find_each do |post|
      post.update(content: post.body)
    end

    remove_column :blog_posts, :body
  end
end
