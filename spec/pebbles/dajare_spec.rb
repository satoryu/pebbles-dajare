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

    describe '#shift' do
      subject { super().shift }
      it { is_expected.to eq('ありがとうござい舛添要一') }
    end

    context 'Giving degree option' do
      let(:keyword) { 'います' }

      subject { Pebbles::Dajare.generate_dajare('ありがとうございます', degree: 3) }

      describe '#shift' do
        subject { super().shift }
        it { is_expected.to eq('ありがとうござ舛添要一') }
      end
    end
    context 'Giving region option' do
      let(:options) { { region: 'us' } }

      subject { Pebbles::Dajare.generate_dajare('ありがとうございます', region: 'us') }

      describe '#shift' do
        subject { super().shift }
        it { is_expected.to eq('ありがとうござい舛添要一') }
      end
    end
  end

  describe "String#dajarize" do
    subject { 'ありがとうございます'.dajarize }

    describe '#shift' do
      subject { super().shift }
      it { is_expected.to eq('ありがとうござい舛添要一') }
    end
  end
end
