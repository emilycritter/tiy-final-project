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
  json.inventory piece.inventory
  json.price piece.price
  json.description piece.description
  json.photo piece.photo
end
