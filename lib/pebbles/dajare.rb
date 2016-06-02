require 'google_suggest'
require 'pebbles/dajare/version'

module Pebbles
  module Dajare

    def generate_dajare(phrase, degree: 2, region: 'jp')
      components = phrase.scan(/./)

      prefix = components[0..-(degree+1)].join
      src_dajare = components[-degree..-1].join

      results = GoogleSuggest.suggest_for(src_dajare, region: region)

      dajares = results.map do |result|
        prefix + result.split(' ').shift
      end
      return dajares
    end

    def dajarize(degree: 2, region: 'jp')
      Pebbles::Dajare.generate_dajare(self.to_s, degree: degree, region: region)
    end

    module_function :generate_dajare
  end
end

class String
  include Pebbles::Dajare
end
