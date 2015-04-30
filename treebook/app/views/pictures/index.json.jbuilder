json.array!(@pictures) do |picture|
  json.extract! picture, :id, :user_id, :album_id, :caption, :description
  json.url picture_url(picture, format: :json)
end
