ENV['AWS_ACCESS_KEY_ID'] = "AKIAI3LNUMEFPJOEYSQA"
ENV['AWS_SECRET_ACCESS_KEY'] = "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"
ENV['S3_BUCKET'] = "frankly-food1"
Aws.config.update({
  region: 'us-east-2',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
