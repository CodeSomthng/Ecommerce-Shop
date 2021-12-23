json.array! @category.products.each do |product|
  json.id product.title
end
