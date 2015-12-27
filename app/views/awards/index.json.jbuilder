json.array!(@awards) do |award|
  json.extract! award, :id, :name, :description
  json.url award_url(award, format: :json)
end
