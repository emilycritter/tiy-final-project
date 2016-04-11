json.piece do
  json.partial! 'piece', piece: @piece
end
json.meta do
  json.time Time.now
end
