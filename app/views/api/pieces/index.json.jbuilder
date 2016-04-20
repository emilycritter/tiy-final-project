json.pieces @pieces do |piece|
  json.partial! 'piece', piece: piece
end
json.nearbyPieces @nearby_pieces do |nearby_piece|
  json.partial! 'piece', piece: nearby_piece
end
json.categories @categories do |category|
  json.id category.id
  json.name category.name
end
json.meta do
  json.time Time.now
end
