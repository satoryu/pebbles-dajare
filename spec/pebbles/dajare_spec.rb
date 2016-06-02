# encoding: utf-8
require 'pebbles/dajare'

describe Pebbles::Dajare do
  before do
    GoogleSuggest.stub(:suggest_for).with('ます').and_return([
      '舛添要一'
    ])
  end

  describe ".generate_dajare" do
    subject { Pebbles::Dajare.generate_dajare 'ありがとうございます' }

    its(:shift) { should == 'ありがとうござい舛添要一' }
  end

  describe "String#dajarize" do
    subject { 'ありがとうございます'.dajarize }

    its(:shift) { should == 'ありがとうござい舛添要一' }
  end
end
