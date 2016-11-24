class DeleteIntegerColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :integer, :string
  end
end
