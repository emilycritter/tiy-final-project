json.user do
  json.id @user.id
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.phone_number @user.phone_number
  if @user.artist
    json.artist @user.artist
    json.artist_piece_count @user.artist.pieces.count
    json.pieces @user.artist.pieces do |piece|
      json.id piece.id
      json.title piece.title
      json.inventory piece.inventory
      json.price piece.price
      json.description piece.description
      json.photo piece.photo
    end
  end
end
