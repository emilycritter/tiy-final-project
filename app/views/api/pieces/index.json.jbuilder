json.pieces @pieces do |piece|
  json.partial! 'piece', piece: piece
end
json.categories @categories do |category|
  json.id category.id
  json.name category.name
end
json.meta do
  json.time Time.now
end
