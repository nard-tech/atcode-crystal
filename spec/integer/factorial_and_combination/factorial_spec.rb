require_relative './../../../lib/integer/factorial_and_combination'

describe Factorial do
  describe '.calc' do
    context 'when an argument is given' do
      it 'returns factorial' do
        expect(described_class.calc( 0)).to eq(                        1)
        expect(described_class.calc( 1)).to eq(                        1)
        expect(described_class.calc( 2)).to eq(                        2)
        expect(described_class.calc( 3)).to eq(                        6)
        expect(described_class.calc( 4)).to eq(                       24)
        expect(described_class.calc( 5)).to eq(                      120)
        expect(described_class.calc( 6)).to eq(                      720)
        expect(described_class.calc( 7)).to eq(                    5_040)
        expect(described_class.calc( 8)).to eq(                   40_320)
        expect(described_class.calc( 9)).to eq(                  362_880)
        expect(described_class.calc(10)).to eq(                3_628_800)

        expect(described_class.calc(11)).to eq(               39_916_800)
        expect(described_class.calc(12)).to eq(              479_001_600)
        expect(described_class.calc(13)).to eq(            6_227_020_800)
        expect(described_class.calc(14)).to eq(           87_178_291_200)
        expect(described_class.calc(15)).to eq(        1_307_674_368_000)
        expect(described_class.calc(16)).to eq(       20_922_789_888_000)
        expect(described_class.calc(17)).to eq(      355_687_428_096_000)
        expect(described_class.calc(18)).to eq(    6_402_373_705_728_000)
        expect(described_class.calc(19)).to eq(  121_645_100_408_832_000)
        expect(described_class.calc(20)).to eq(2_432_902_008_176_640_000)
      end
    end

    context 'when two arguments are given' do
      let :mod do
        10**9 + 7
      end

      it 'returns remainder of factorial when divided by the second argument' do
        expect(described_class.calc( 0, mod)).to eq(          1)
        expect(described_class.calc( 1, mod)).to eq(          1)
        expect(described_class.calc( 2, mod)).to eq(          2)
        expect(described_class.calc( 3, mod)).to eq(          6)
        expect(described_class.calc( 4, mod)).to eq(         24)
        expect(described_class.calc( 5, mod)).to eq(        120)
        expect(described_class.calc( 6, mod)).to eq(        720)
        expect(described_class.calc( 7, mod)).to eq(      5_040)
        expect(described_class.calc( 8, mod)).to eq(     40_320)
        expect(described_class.calc( 9, mod)).to eq(    362_880)
        expect(described_class.calc(10, mod)).to eq(  3_628_800)

        expect(described_class.calc(11, mod)).to eq( 39_916_800)
        expect(described_class.calc(12, mod)).to eq(479_001_600)
        expect(described_class.calc(13, mod)).to eq(227_020_758)
        expect(described_class.calc(14, mod)).to eq(178_290_591)
        expect(described_class.calc(15, mod)).to eq(674_358_851)
        expect(described_class.calc(16, mod)).to eq(789_741_546)
        expect(described_class.calc(17, mod)).to eq(425_606_191)
        expect(described_class.calc(18, mod)).to eq(660_911_389)
        expect(described_class.calc(19, mod)).to eq(557_316_307)
        expect(described_class.calc(20, mod)).to eq(146_326_063)
      end
    end
  end

  describe '#get' do
    context 'when "mod" is NOT specified in the instance' do
      let :instance do
        described_class.generate(20)
      end

      it 'returns factorial' do
        expect(instance.get( 0)).to eq(                        1)
        expect(instance.get( 1)).to eq(                        1)
        expect(instance.get( 2)).to eq(                        2)
        expect(instance.get( 3)).to eq(                        6)
        expect(instance.get( 4)).to eq(                       24)
        expect(instance.get( 5)).to eq(                      120)
        expect(instance.get( 6)).to eq(                      720)
        expect(instance.get( 7)).to eq(                    5_040)
        expect(instance.get( 8)).to eq(                   40_320)
        expect(instance.get( 9)).to eq(                  362_880)
        expect(instance.get(10)).to eq(                3_628_800)

        expect(instance.get(11)).to eq(               39_916_800)
        expect(instance.get(12)).to eq(              479_001_600)
        expect(instance.get(13)).to eq(            6_227_020_800)
        expect(instance.get(14)).to eq(           87_178_291_200)
        expect(instance.get(15)).to eq(        1_307_674_368_000)
        expect(instance.get(16)).to eq(       20_922_789_888_000)
        expect(instance.get(17)).to eq(      355_687_428_096_000)
        expect(instance.get(18)).to eq(    6_402_373_705_728_000)
        expect(instance.get(19)).to eq(  121_645_100_408_832_000)
        expect(instance.get(20)).to eq(2_432_902_008_176_640_000)
      end
    end

    context 'when "mod" is specified in the instance' do
      let :mod do
        10**9 + 7
      end

      let :instance do
        described_class.generate(20, mod)
      end

      it 'returns remainder of factorial when divided by the specified mod' do
        expect(instance.get( 0)).to eq(          1)
        expect(instance.get( 1)).to eq(          1)
        expect(instance.get( 2)).to eq(          2)
        expect(instance.get( 3)).to eq(          6)
        expect(instance.get( 4)).to eq(         24)
        expect(instance.get( 5)).to eq(        120)
        expect(instance.get( 6)).to eq(        720)
        expect(instance.get( 7)).to eq(      5_040)
        expect(instance.get( 8)).to eq(     40_320)
        expect(instance.get( 9)).to eq(    362_880)
        expect(instance.get(10)).to eq(  3_628_800)

        expect(instance.get(11)).to eq( 39_916_800)
        expect(instance.get(12)).to eq(479_001_600)
        expect(instance.get(13)).to eq(227_020_758)
        expect(instance.get(14)).to eq(178_290_591)
        expect(instance.get(15)).to eq(674_358_851)
        expect(instance.get(16)).to eq(789_741_546)
        expect(instance.get(17)).to eq(425_606_191)
        expect(instance.get(18)).to eq(660_911_389)
        expect(instance.get(19)).to eq(557_316_307)
        expect(instance.get(20)).to eq(146_326_063)
      end
    end
  end
end
