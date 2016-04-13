json.user do
  json.partial! 'users', user: @user
end
json.meta do
  json.time Time.now
end
