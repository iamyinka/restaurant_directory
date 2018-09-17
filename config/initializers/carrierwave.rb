CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'awsrestaurant'
  config.aws_acl    = 'public-read'

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  # config.asset_host = 'http://example.com'
  # config.asset_host_public = true

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     ENV["access_key_id"],
    secret_access_key: ENV["secret_access_key"],
    region:            'us-west-2', # Required
    stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }

  # Optional: Signing of download urls, e.g. for serving private content through
  # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
  # configured:
  # config.aws_signer = -> (unsigned_url, options) do
  #   Aws::CF::Signer.sign_url(unsigned_url, options)
  # end
end


# CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'                        # required
#   config.fog_credentials = {
#     provider:              'AWS',                        # required
#     aws_access_key_id:     'AKIAIJOVEFKO5A2ERRDQ',                        # required unless using use_iam_profile
#     aws_secret_access_key: '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',                        # required unless using use_iam_profile
#   }
#   config.fog_directory  = 'awsrestaurant1'                                      # required
# end