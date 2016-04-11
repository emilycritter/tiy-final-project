json.id piece.id
json.title piece.title
json.price piece.price
json.price_in_cents piece.price_in_cents
json.inventory piece.inventory
json.artist do
  json.id piece.artist.id
  json.shop_name piece.artist.shop_name
  json.user_id piece.artist.user_id
end
json.photo piece.photo
json.photo_url attachment_url(piece, :photo, :fill, 300, 300, format: "jpg")