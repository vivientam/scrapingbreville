class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :code_id
      t.string :product_image
      t.decimal :price

      t.timestamps
    end
  end
end
