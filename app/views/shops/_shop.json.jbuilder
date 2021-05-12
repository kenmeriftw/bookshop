json.shops(@shops) do |shop|
  json.id shop.id
  json.name shop.title
  json.books_sold_count shop.books_sold_count
  json.book_in_stock shop.books
end
