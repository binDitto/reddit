class RemovePostCategories < ActiveRecord::Migration[5.0]
  def change
    drop_table :post_categories
  end
end
