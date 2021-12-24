# json.id @category.id
# json.title @category.title
json.extract! @category, :id, :title
json.update_url api_category_path(@category)
