require "./../../../lib/integer/factorial_and_combination"

describe FactorialInverse do
  describe ".calc" do
    describe "when mod is 13" do
      mod = 13_i64

      it "returns factorial inverse of the given integer for the specified mod" do
        FactorialInverse.calc(1_i64, mod).should eq(1_i64)
        FactorialInverse.calc(2_i64, mod).should eq(7_i64)
        FactorialInverse.calc(3_i64, mod).should eq(11_i64)
        FactorialInverse.calc(4_i64, mod).should eq(6_i64)
        FactorialInverse.calc(5_i64, mod).should eq(9_i64)
        FactorialInverse.calc(6_i64, mod).should eq(8_i64)
        FactorialInverse.calc(7_i64, mod).should eq(3_i64)
        FactorialInverse.calc(8_i64, mod).should eq(2_i64)
        FactorialInverse.calc(9_i64, mod).should eq(6_i64)
        FactorialInverse.calc(10_i64, mod).should eq(11_i64)
        FactorialInverse.calc(11_i64, mod).should eq(1_i64)
        FactorialInverse.calc(12_i64, mod).should eq(12_i64)
      end
    end
  end

  describe ".generate" do
    describe "when mod is 13" do
      mod = 13_i64
      instance = FactorialInverse.generate(mod - 1, mod)

      it "returns an instance of FactorialInverse" do
        instance.should be_a(FactorialInverse)
      end
    end
  end

  describe "#get" do
    describe "when mod is 13" do
      mod = 13_i64
      instance = FactorialInverse.generate(mod - 1, mod)

      it "returns factorial inverse of the given integer for the specified mod" do
        instance.get(1_i64).should eq(1_i64)
        instance.get(2_i64).should eq(7_i64)
        instance.get(3_i64).should eq(11_i64)
        instance.get(4_i64).should eq(6_i64)
        instance.get(5_i64).should eq(9_i64)
        instance.get(6_i64).should eq(8_i64)
        instance.get(7_i64).should eq(3_i64)
        instance.get(8_i64).should eq(2_i64)
        instance.get(9_i64).should eq(6_i64)
        instance.get(10_i64).should eq(11_i64)
        instance.get(11_i64).should eq(1_i64)
        instance.get(12_i64).should eq(12_i64)
      end
    end
  end
end
