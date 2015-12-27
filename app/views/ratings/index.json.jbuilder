json.array!(@ratings) do |rating|
  json.extract! rating, :id, :number, :user_id
  json.url rating_url(rating, format: :json)
end
