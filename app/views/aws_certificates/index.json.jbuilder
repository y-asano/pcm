json.array!(@aws_certificates) do |aws_certificate|
  json.extract! aws_certificate, :id, :USER_NO, :PLATFORM_NO, :AWS_ACCESS_ID, :AWS_SECRET_KEY, :DEF_KEYPAIR, :DEF_SUBNET, :DEF_LB_SUBNET
  json.url aws_certificate_url(aws_certificate, format: :json)
end
