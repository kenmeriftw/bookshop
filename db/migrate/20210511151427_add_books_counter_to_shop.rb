class AddBooksCounterToShop < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :books_sold_count, :integer, default: 0
  end
end
