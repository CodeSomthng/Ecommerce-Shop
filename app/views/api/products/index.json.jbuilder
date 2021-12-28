json.array! @category.products.each do |product|
  json.title product.title
end
