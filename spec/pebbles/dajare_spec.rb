# encoding: utf-8
require 'pebbles/dajare'

describe Pebbles::Dajare do
  before do
    GoogleSuggest.stub(:suggest_for).with('ます').and_return([
      {'suggestion' => '益若つばさ'}
    ])
  end
  
  subject { Pebbles::Dajare.generate_dajare 'ありがとうございます' }
  its(:shift) { should == 'ありがとうござい益若つばさ' }

end
