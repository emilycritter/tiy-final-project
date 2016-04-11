json.pieces @pieces do |piece|
  json.partial! 'piece', piece: piece
end
json.meta do
  json.time Time.now
end
