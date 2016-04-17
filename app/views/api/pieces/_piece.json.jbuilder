json.id piece.id
json.title piece.title
json.price piece.price
json.price_formatted piece.price_formatted
json.price_in_cents piece.price_in_cents
json.inventory piece.inventory
json.artist do
  json.id piece.artist.id
  json.shop_name piece.artist.shop_name
  json.user_id piece.artist.user_id
  json.photo_url piece.artist.photo_url
end
json.photo piece.photo
json.photo_url piece.photo_url
json.piece_url piece_path(id: piece.id)
