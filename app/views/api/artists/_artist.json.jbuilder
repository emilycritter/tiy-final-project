json.id artist.id
json.shop_name artist.shop_name
json.name_parameterize artist.name_parameterize
json.artist_piece_count artist.pieces.count
json.bio artist.bio

json.user_id artist.user_id
json.first_name artist.user.first_name
json.last_name artist.user.last_name
json.email artist.user.email
json.phone_number artist.user.phone_number

json.pieces artist.pieces do |piece|
  json.id piece.id
  json.title piece.title
  json.price piece.price
  json.price_formatted piece.price_formatted
  json.price_in_cents piece.price_in_cents
  json.inventory piece.inventory
  json.photo piece.photo
  json.photo_url attachment_url(piece, :photo, :fill, 400, 400, format: "jpg")
  json.piece_url piece_path(id: piece.id)
  json.artist do
    json.shop_name piece.artist.shop_name
  end
end
