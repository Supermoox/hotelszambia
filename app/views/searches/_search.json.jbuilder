json.extract! search, :id, :keywords, :category_id, :city_id, :created_at, :updated_at
json.url search_url(search, format: :json)
