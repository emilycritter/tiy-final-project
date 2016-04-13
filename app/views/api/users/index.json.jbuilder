json.users @users do |user|
  json.partial! 'users', user: user
end
json.meta do
  json.time Time.now
  json.current_user @current_user if @current_user.present?
end
