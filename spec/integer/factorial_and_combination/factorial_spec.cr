require "spec"
require "./../../../lib/integer/factorial_and_combination"

describe Factorial do
  describe ".calc" do
    context "when an argument is given" do
      it "returns factorial" do
        Factorial.calc(0_i64).should eq(1_i64)
        Factorial.calc(1_i64).should eq(1_i64)
        Factorial.calc(2_i64).should eq(2_i64)
        Factorial.calc(3_i64).should eq(6_i64)
        Factorial.calc(4_i64).should eq(24_i64)
        Factorial.calc(5_i64).should eq(120_i64)
        Factorial.calc(6_i64).should eq(720_i64)
        Factorial.calc(7_i64).should eq(5_040_i64)
        Factorial.calc(8_i64).should eq(40_320_i64)
        Factorial.calc(9_i64).should eq(362_880_i64)
        Factorial.calc(10_i64).should eq(3_628_800_i64)

        Factorial.calc(11_i64).should eq(39_916_800_i64)
        Factorial.calc(12_i64).should eq(479_001_600_i64)
        Factorial.calc(13_i64).should eq(6_227_020_800_i64)
        Factorial.calc(14_i64).should eq(87_178_291_200_i64)
        Factorial.calc(15_i64).should eq(1_307_674_368_000_i64)
        Factorial.calc(16_i64).should eq(20_922_789_888_000_i64)
        Factorial.calc(17_i64).should eq(355_687_428_096_000_i64)
        Factorial.calc(18_i64).should eq(6_402_373_705_728_000_i64)
        Factorial.calc(19_i64).should eq(121_645_100_408_832_000_i64)
        Factorial.calc(20_i64).should eq(2_432_902_008_176_640_000_i64)
      end
    end

    context "when two arguments are given" do
      mod = 10_i64**9 + 7

      it "returns remainder of factorial when divided by the second argument" do
        Factorial.calc(0_i64, mod).should eq(1)
        Factorial.calc(1_i64, mod).should eq(1)
        Factorial.calc(2_i64, mod).should eq(2)
        Factorial.calc(3_i64, mod).should eq(6)
        Factorial.calc(4_i64, mod).should eq(24)
        Factorial.calc(5_i64, mod).should eq(120)
        Factorial.calc(6_i64, mod).should eq(720)
        Factorial.calc(7_i64, mod).should eq(5_040)
        Factorial.calc(8_i64, mod).should eq(40_320)
        Factorial.calc(9_i64, mod).should eq(362_880)
        Factorial.calc(10_i64, mod).should eq(3_628_800)

        Factorial.calc(11_i64, mod).should eq(39_916_800_i64)
        Factorial.calc(12_i64, mod).should eq(479_001_600_i64)
        Factorial.calc(13_i64, mod).should eq(227_020_758_i64)
        Factorial.calc(14_i64, mod).should eq(178_290_591_i64)
        Factorial.calc(15_i64, mod).should eq(674_358_851_i64)
        Factorial.calc(16_i64, mod).should eq(789_741_546_i64)
        Factorial.calc(17_i64, mod).should eq(425_606_191_i64)
        Factorial.calc(18_i64, mod).should eq(660_911_389_i64)
        Factorial.calc(19_i64, mod).should eq(557_316_307_i64)
        Factorial.calc(20_i64, mod).should eq(146_326_063_i64)
      end
    end
  end

  describe "#get" do
    context "when \"mod\" is NOT specified in the instance" do
      instance = Factorial.generate(20_i64)

      it "returns factorial" do
        instance.get(0_i64).should eq(1_i64)
        instance.get(1_i64).should eq(1_i64)
        instance.get(2_i64).should eq(2_i64)
        instance.get(3_i64).should eq(6_i64)
        instance.get(4_i64).should eq(24_i64)
        instance.get(5_i64).should eq(120_i64)
        instance.get(6_i64).should eq(720_i64)
        instance.get(7_i64).should eq(5_040_i64)
        instance.get(8_i64).should eq(40_320_i64)
        instance.get(9_i64).should eq(362_880_i64)
        instance.get(10_i64).should eq(3_628_800_i64)

        instance.get(11_i64).should eq(39_916_800_i64)
        instance.get(12_i64).should eq(479_001_600_i64)
        instance.get(13_i64).should eq(6_227_020_800_i64)
        instance.get(14_i64).should eq(87_178_291_200_i64)
        instance.get(15_i64).should eq(1_307_674_368_000_i64)
        instance.get(16_i64).should eq(20_922_789_888_000_i64)
        instance.get(17_i64).should eq(355_687_428_096_000_i64)
        instance.get(18_i64).should eq(6_402_373_705_728_000_i64)
        instance.get(19_i64).should eq(121_645_100_408_832_000_i64)
        instance.get(20_i64).should eq(2_432_902_008_176_640_000_i64)
      end
    end

    context "when \"mod\" is specified in the instance" do
      mod = 10_i64**9 + 7
      instance = Factorial.generate(20_i64, mod)

      it "returns remainder of factorial when divided by the specified mod" do
        instance.get(0_i64).should eq(1_i64)
        instance.get(1_i64).should eq(1_i64)
        instance.get(2_i64).should eq(2_i64)
        instance.get(3_i64).should eq(6_i64)
        instance.get(4_i64).should eq(24_i64)
        instance.get(5_i64).should eq(120_i64)
        instance.get(6_i64).should eq(720_i64)
        instance.get(7_i64).should eq(5_040_i64)
        instance.get(8_i64).should eq(40_320_i64)
        instance.get(9_i64).should eq(362_880_i64)
        instance.get(10_i64).should eq(3_628_800_i64)

        instance.get(11_i64).should eq(39_916_800_i64)
        instance.get(12_i64).should eq(479_001_600_i64)
        instance.get(13_i64).should eq(227_020_758_i64)
        instance.get(14_i64).should eq(178_290_591_i64)
        instance.get(15_i64).should eq(674_358_851_i64)
        instance.get(16_i64).should eq(789_741_546_i64)
        instance.get(17_i64).should eq(425_606_191_i64)
        instance.get(18_i64).should eq(660_911_389_i64)
        instance.get(19_i64).should eq(557_316_307_i64)
        instance.get(20_i64).should eq(146_326_063_i64)
      end
    end
  end
end
