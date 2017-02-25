class PostCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :post_categories do |p|
      p.integer :post_id
      p.integer :category_id
    end
  end
end
