json.array!(@aws_images) do |aws_image|
  json.extract! aws_image, :id, :IMAGE_NO, :IMAGE_ID, :KERNEL_ID, :RAMDISK_ID, :INSTANCE_TYPES, :EBS_IMAGE
  json.url aws_image_url(aws_image, format: :json)
end
