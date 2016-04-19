json.array!(@schools) do |school|
  json.extract! school, :id, :name, :avg_class_size, :description
  json.url school_url(school, format: :json)
end
