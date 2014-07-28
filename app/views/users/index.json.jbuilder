json.array!(@users) do |user|
  json.extract! user, :id, :USER_NO, :USERNAME, :PASSWORD, :MASTER_USER, :POWER_USER
  json.url user_url(user, format: :json)
end
