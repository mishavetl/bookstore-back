class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :photo
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
