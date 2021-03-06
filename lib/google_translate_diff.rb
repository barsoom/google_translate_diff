require "ox"
require "punkt-segmenter"
require "dry/initializer"
require "google/cloud/translate"

require "google_translate_diff/version"
require "google_translate_diff/tokenizer"
require "google_translate_diff/linearizer"
require "google_translate_diff/chunker"
require "google_translate_diff/spacing"
require "google_translate_diff/cache"
require "google_translate_diff/redis_cache_store"
require "google_translate_diff/redis_rate_limiter"
require "google_translate_diff/request"

module GoogleTranslateDiff
  class << self
    attr_accessor :api
    attr_accessor :cache_store
    attr_accessor :rate_limiter

    def translate(*args)
      Request.new(*args).call
    end
  end

  CACHE_NAMESPACE = "google-translate-diff".freeze
end
