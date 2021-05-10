class CreateBookShops < ActiveRecord::Migration[6.1]
  def change
    create_table :book_shops do |t|
      t.belongs_to :book, index: true
      t.belongs_to :shop, index: true
      t.timestamps
    end
  end
end
