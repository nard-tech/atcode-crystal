require "spec"
require "./../../../lib/integer/factorial_and_combination"

describe Inverse do
  describe ".calc" do
    context "when mod is 13" do
      mod = 13_i64

      it "returns inverse of given integer" do
        Inverse.calc(1_i64, mod).should eq(1_i64)
        Inverse.calc(2_i64, mod).should eq(7_i64)
        Inverse.calc(3_i64, mod).should eq(9_i64)
        Inverse.calc(4_i64, mod).should eq(10_i64)
        Inverse.calc(5_i64, mod).should eq(8_i64)
        Inverse.calc(6_i64, mod).should eq(11_i64)
        Inverse.calc(7_i64, mod).should eq(2_i64)
        Inverse.calc(8_i64, mod).should eq(5_i64)
        Inverse.calc(9_i64, mod).should eq(3_i64)
        Inverse.calc(10_i64, mod).should eq(4_i64)
        Inverse.calc(11_i64, mod).should eq(6_i64)
        Inverse.calc(12_i64, mod).should eq(12_i64)
      end
    end
  end

  describe "#get" do
    describe "when mod is 13" do
      mod = 13_i64
      instance = Inverse.generate(12_i64, mod)

      it "returns inverse of the given integer for the specified mod" do
        instance.get(1_i64).should eq(1_i64)
        instance.get(2_i64).should eq(7_i64)
        instance.get(3_i64).should eq(9_i64)
        instance.get(4_i64).should eq(10_i64)
        instance.get(5_i64).should eq(8_i64)
        instance.get(6_i64).should eq(11_i64)
        instance.get(7_i64).should eq(2_i64)
        instance.get(8_i64).should eq(5_i64)
        instance.get(9_i64).should eq(3_i64)
        instance.get(10_i64).should eq(4_i64)
        instance.get(11_i64).should eq(6_i64)
        instance.get(12_i64).should eq(12_i64)
      end
    end
  end
end
