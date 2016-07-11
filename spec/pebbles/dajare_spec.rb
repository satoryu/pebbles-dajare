require 'pebbles/dajare'

describe Pebbles::Dajare do
  let(:options) { { region: 'jp' } }
  let(:keyword) { 'ます' }

  before do
    allow(GoogleSuggest).to receive(:suggest_for).with(keyword, options).and_return([
      '舛添要一'
    ])
  end

  describe ".generate_dajare" do
    subject { Pebbles::Dajare.generate_dajare 'ありがとうございます' }

    it { is_expected.to match_array(%w[ありがとうござい舛添要一]) }

    context 'Giving degree option' do
      let(:keyword) { 'います' }

      subject { Pebbles::Dajare.generate_dajare('ありがとうございます', degree: 3) }

      it { is_expected.to match_array(%w[ありがとうござ舛添要一]) }
    end
    context 'Giving region option' do
      let(:options) { { region: 'us' } }

      subject { Pebbles::Dajare.generate_dajare('ありがとうございます', region: 'us') }

      it { is_expected.to match_array(%w[ありがとうござい舛添要一]) }
    end
  end

  describe "String#dajarize" do
    subject { 'ありがとうございます'.dajarize }

    it { is_expected.to match_array(%w[ありがとうござい舛添要一]) }
  end
end
