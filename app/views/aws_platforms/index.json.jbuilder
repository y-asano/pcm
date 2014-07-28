json.array!(@aws_platforms) do |aws_platform|
  json.extract! aws_platform, :id, :PLATFORM_NO, :HOST, :PORT, :SECURE, :EUCA, :VPC, :REGION, :AVAILABILITY_ZONE, :VPC_ID
  json.url aws_platform_url(aws_platform, format: :json)
end
