json.artists @artists do |artist|
  json.partial! 'artist', artist: artist
end
json.meta do
  json.time Time.now
end
