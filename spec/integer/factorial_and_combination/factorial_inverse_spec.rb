require_relative './../../../lib/integer/factorial_and_combination'

describe FactorialInverse do
  describe '.calc' do
    describe 'when mod is 13' do
      let :mod do
        13
      end

      it 'returns factorial inverse of the given integer for the specified mod' do
        expect(described_class.calc( 1, mod)).to eq( 1)
        expect(described_class.calc( 2, mod)).to eq( 7)
        expect(described_class.calc( 3, mod)).to eq(11)
        expect(described_class.calc( 4, mod)).to eq( 6)
        expect(described_class.calc( 5, mod)).to eq( 9)
        expect(described_class.calc( 6, mod)).to eq( 8)
        expect(described_class.calc( 7, mod)).to eq( 3)
        expect(described_class.calc( 8, mod)).to eq( 2)
        expect(described_class.calc( 9, mod)).to eq( 6)
        expect(described_class.calc(10, mod)).to eq(11)
        expect(described_class.calc(11, mod)).to eq( 1)
        expect(described_class.calc(12, mod)).to eq(12)
      end
    end
  end

  describe '.generate' do
    let :mod do
      13
    end

    let :instance do
      described_class.generate(mod - 1, mod)
    end

    it 'returns an instance of FactorialInverse' do
      expect(instance).to be_instance_of(FactorialInverse)
    end
  end

  describe '#get' do
    let :instance do
      described_class.generate(mod - 1, mod)
    end

    describe 'when mod is 13' do
      let :mod do
        13
      end

      it 'returns factorial inverse of the given integer for the specified mod' do
        expect(instance.get( 1)).to eq( 1)
        expect(instance.get( 2)).to eq( 7)
        expect(instance.get( 3)).to eq(11)
        expect(instance.get( 4)).to eq( 6)
        expect(instance.get( 5)).to eq( 9)
        expect(instance.get( 6)).to eq( 8)
        expect(instance.get( 7)).to eq( 3)
        expect(instance.get( 8)).to eq( 2)
        expect(instance.get( 9)).to eq( 6)
        expect(instance.get(10)).to eq(11)
        expect(instance.get(11)).to eq( 1)
        expect(instance.get(12)).to eq(12)
      end
    end
  end
end
