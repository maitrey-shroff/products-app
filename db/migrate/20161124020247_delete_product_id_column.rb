class DeleteProductIdColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :product_id, :string
  end
end
