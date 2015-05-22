require 'aws-sdk-resources'

require 'publish2'

module Publish2::Backends

  class S3 < Publish2::Backends::Base

    attr_reader :bucket, :url_params

    def initialize(options = {})
      @bucket = S3.coerce_bucket!(options.fetch(:bucket))
      @url_params = options.fetch(:url_params, {})
    end

    def self.coerce_bucket!(thing)
      if thing.is_a? Aws::S3::Bucket
        return thing
      elsif thing.is_a? String
        r = Aws::S3::Resource.new
        return r.bucket(thing)

      else
        raise ArgumentError, "Cannot coerce input into Aws::S3::Bucket : #{thing}"

      end
    end

    def publish(name, src_path)
      obj = bucket.object(name)
      obj.upload_file(src_path)

      return {
        bucket_name: bucket.name,
        object_name: name,
        url:         obj.presigned_url(:get, url_params)
      }
    end

  end

end
