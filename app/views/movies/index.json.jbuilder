json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :description, :trailer, :genre, :director_id
  json.url movie_url(movie, format: :json)
end
