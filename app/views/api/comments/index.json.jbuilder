# json.extract! @comment, :title
json.array! @product.comments.each do |comment|
  json.title comment.title
end
