json.array! @cart do |cart|
  json.name cart.user.name
  json.id cart.product.id
  json.title cart.product.title
end
