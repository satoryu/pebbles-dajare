require 'google_suggest'

module Pebbles
  module Dajare
    VERSION = '0.0.1'

    def generate_dajare(phrase, degree=2)
      components = phrase.scan(/./)

      prefix = components[0..-(degree+1)].join
      src_dajare = components[-degree..-1].join

      results = GoogleSuggest.suggest_for(src_dajare)

      dajares = results.map do |result|
        prefix + result['suggestion'].split(' ').shift
      end
      return dajares
    end

    module_function :generate_dajare
  end
end
