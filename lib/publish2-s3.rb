
require 'publish2'

module Publish2::Backends

  class S3 < Publish2::Backends::Base

    attr_reader :bucket, :url_params

    def initialize(options = {})
      @bucket = options.fetch(:bucket)
      @url_params = options.fetch(:url_params, {})
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
