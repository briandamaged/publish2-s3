
Gem::Specification.new do |s|
  s.name        = 'publish2-s3'
  s.version     = '1.0.0.alpha.1'
  s.date        = '2015-05-22'
  s.summary     = "Publish2 backend for AWS-S3"
  s.description = "Publish2 backend for AWS-S3"
  s.homepage    = "https://github.com/briandamaged/publish2-s3"
  s.authors     = ["Brian Lauber"]
  s.email       = 'constructible.truth@gmail.com'
  s.files       = Dir["lib/**/*.rb"]
  s.license     = "MIT"

  s.add_dependency "publish2", '~> 1.0.0.alpha'
end

