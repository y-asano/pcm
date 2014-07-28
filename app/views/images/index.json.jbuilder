json.array!(@images) do |image|
  json.extract! image, :id, :IMAGE_NO, :PLATFORM_NO, :IMAGE_NAME, :IMAGE_NAME_DISP, :OS, :OS_DISP, :SELECTABLE, :COMPONENT_TYPE_NOS, :ZABBIX_TEMPLATE
  json.url image_url(image, format: :json)
end
