json.array!(@platforms) do |platform|
  json.extract! platform, :PLATFORM_NO, :PLATFORM_NAME, :PLATFORM_NAME_DISP, :PLATFORM_SIMPLENAME_DISP, :INTERNAL, :PROXY, :PLATFORM_TYPE, :SELECTABLE
  json.url platform_url(platform, format: :json)
end
