class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image_1
      t.string :product_id
      t.string :integer

      t.timestamps
    end
  end
end
