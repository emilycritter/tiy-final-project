json.id piece.id
json.title piece.title
json.price piece.price
json.price_formatted piece.price_formatted
json.price_in_cents piece.price_in_cents
json.inventory piece.inventory
json.artist do
  json.id piece.artist.id
  json.shop_name piece.artist.shop_name
  json.photo_url piece.artist.photo_url
  json.location piece.artist.location
  json.city piece.artist.city
  json.state piece.artist.state
  json.city_state piece.artist.city_state
  json.user_id piece.artist.user_id
end
json.categories piece.categories.each do |category|
  json.id category.id
  json.name category.name
end
json.photo piece.photo
json.photo_url piece.photo_url
json.piece_url piece_path(id: piece.id)
