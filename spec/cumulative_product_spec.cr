require "spec"
require "./../lib/cumulative_sum"
require "./../lib/integer/factorial_and_combination"

def instance_between(instance : CumulativeProduct, i, j, inverse_instance, mod)
  instance.between(i, j) do |a, b|
    a_inverse = inverse_instance.get(a)
    raise "TypeError: a_inverse is nil." if a_inverse.nil?
    (b * a_inverse.as(Int64)) % mod
  end
end

describe CumulativeProduct do
  describe ".generate (class method)" do
    context "when executed without block" do
      context "arithmetic sequence" do
        it "returns an instance of CumulativeProduct." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeProduct(Int32).generate(array)

          be_a(CumulativeProduct(Int32)) { instance }
        end
      end

      context "Fibonacci sequence" do
        it "returns an instance of CumulativeProduct." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeProduct(Int32).generate(array)

          be_a(CumulativeProduct(Int32)) { instance }
        end
      end
    end

    context "when executed with block" do
      mod = 10_007
      inverse_instance = Inverse.generate((mod - 1).to_i64, mod.to_i64)

      context "arithmetic sequence" do
        it "returns an instance of CumulativeProduct." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeProduct(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          be_a(CumulativeProduct(Int32)) { instance }
        end
      end

      context "Fibonacci sequence" do
        it "returns an instance of CumulativeProduct." do
          mod = 3
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeProduct(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          be_a(CumulativeProduct(Int32)) { instance }
        end
      end
    end
  end

  describe ".#result" do
    context "when .generate is executed without block" do
      context "arithmetic sequence" do
        it "returns array of cumulative sum." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeProduct(Int32).generate(array)

          instance.result.should \
            eq([1, 1, 2, 6, 24, 120, 720, 5_040, 40_320, 362_880, 3_628_800])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeProduct(Int32).generate(array)

          instance.result.should \
            eq([1, 1, 1, 2, 6, 30, 240, 3_120, 65_520, 2_227_680, 122_522_400])
        end
      end
    end

    context "when .generate is executed with block" do
      mod = 10_007
      inverse_instance = Inverse.generate((mod - 1).to_i64, mod.to_i64)

      context "arithmetic sequence" do
        it "returns array of cumulative sum calculated by logic in given block." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeProduct(Int32).generate(array) do |last, i|
            (last * i) % mod
          end

          instance.result.should \
            eq([1, 1, 2, 6, 24, 120, 720, 5_040, 292, 2628, 6266])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum calculated by logic in given block." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeProduct(Int32).generate(array) do |last, i|
            (last * i) % mod
          end

          instance.result.should \
            eq([1, 1, 1, 2, 6, 30, 240, 3_120, 5478, 6126, 6699])
        end
      end
    end
  end

  describe "#between" do
    context "when .generate is executed without block" do
      context "arithmetic sequence" do
        it "returns a value of cumulative product between given indexes." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeProduct(Int32).generate(array)

          instance.between(0, 0).should eq(1)
          instance.between(0, 1).should eq(2)
          instance.between(0, 2).should eq(6)
          instance.between(0, 3).should eq(24)
          instance.between(0, 4).should eq(120)
          instance.between(0, 5).should eq(720)
          instance.between(0, 6).should eq(5_040)
          instance.between(0, 7).should eq(40_320)
          instance.between(0, 8).should eq(362_880)
          instance.between(0, 9).should eq(3_628_800)

          expect_raises(Exception) { instance.between(1, 0) }
          instance.between(1, 1).should eq(2)
          instance.between(1, 2).should eq(6)
          instance.between(1, 3).should eq(24)
          instance.between(1, 4).should eq(120)
          instance.between(1, 5).should eq(720)
          instance.between(1, 6).should eq(5_040)
          instance.between(1, 7).should eq(40_320)
          instance.between(1, 8).should eq(362_880)
          instance.between(1, 9).should eq(3_628_800)

          expect_raises(Exception) { instance.between(2, 0) }
          expect_raises(Exception) { instance.between(2, 1) }
          instance.between(2, 2).should eq(3)
          instance.between(2, 3).should eq(12)
          instance.between(2, 4).should eq(60)
          instance.between(2, 5).should eq(360)
          instance.between(2, 6).should eq(2_520)
          instance.between(2, 7).should eq(20_160)
          instance.between(2, 8).should eq(181_440)
          instance.between(2, 9).should eq(1_814_400)

          expect_raises(Exception) { instance.between(3, 0) }
          expect_raises(Exception) { instance.between(3, 1) }
          expect_raises(Exception) { instance.between(3, 2) }
          instance.between(3, 3).should eq(4)
          instance.between(3, 4).should eq(20)
          instance.between(3, 5).should eq(120)
          instance.between(3, 6).should eq(840)
          instance.between(3, 7).should eq(6_720)
          instance.between(3, 8).should eq(60_480)
          instance.between(3, 9).should eq(604_800)

          expect_raises(Exception) { instance.between(4, 0) }
          expect_raises(Exception) { instance.between(4, 1) }
          expect_raises(Exception) { instance.between(4, 2) }
          expect_raises(Exception) { instance.between(4, 3) }
          instance.between(4, 4).should eq(5)
          instance.between(4, 5).should eq(30)
          instance.between(4, 6).should eq(210)
          instance.between(4, 7).should eq(1_680)
          instance.between(4, 8).should eq(15_120)
          instance.between(4, 9).should eq(151_200)

          expect_raises(Exception) { instance.between(5, 0) }
          expect_raises(Exception) { instance.between(5, 1) }
          expect_raises(Exception) { instance.between(5, 2) }
          expect_raises(Exception) { instance.between(5, 3) }
          expect_raises(Exception) { instance.between(5, 4) }
          instance.between(5, 5).should eq(6)
          instance.between(5, 6).should eq(42)
          instance.between(5, 7).should eq(336)
          instance.between(5, 8).should eq(3_024)
          instance.between(5, 9).should eq(30_240)

          expect_raises(Exception) { instance.between(6, 0) }
          expect_raises(Exception) { instance.between(6, 1) }
          expect_raises(Exception) { instance.between(6, 2) }
          expect_raises(Exception) { instance.between(6, 3) }
          expect_raises(Exception) { instance.between(6, 4) }
          expect_raises(Exception) { instance.between(6, 5) }
          instance.between(6, 6).should eq(7)
          instance.between(6, 7).should eq(56)
          instance.between(6, 8).should eq(504)
          instance.between(6, 9).should eq(5_040)

          expect_raises(Exception) { instance.between(7, 0) }
          expect_raises(Exception) { instance.between(7, 1) }
          expect_raises(Exception) { instance.between(7, 2) }
          expect_raises(Exception) { instance.between(7, 3) }
          expect_raises(Exception) { instance.between(7, 4) }
          expect_raises(Exception) { instance.between(7, 5) }
          expect_raises(Exception) { instance.between(7, 6) }
          instance.between(7, 7).should eq(8)
          instance.between(7, 8).should eq(72)
          instance.between(7, 9).should eq(720)

          expect_raises(Exception) { instance.between(8, 0) }
          expect_raises(Exception) { instance.between(8, 1) }
          expect_raises(Exception) { instance.between(8, 2) }
          expect_raises(Exception) { instance.between(8, 3) }
          expect_raises(Exception) { instance.between(8, 4) }
          expect_raises(Exception) { instance.between(8, 5) }
          expect_raises(Exception) { instance.between(8, 6) }
          expect_raises(Exception) { instance.between(8, 7) }
          instance.between(8, 8).should eq(9)
          instance.between(8, 9).should eq(90)

          expect_raises(Exception) { instance.between(9, 0) }
          expect_raises(Exception) { instance.between(9, 1) }
          expect_raises(Exception) { instance.between(9, 2) }
          expect_raises(Exception) { instance.between(9, 3) }
          expect_raises(Exception) { instance.between(9, 4) }
          expect_raises(Exception) { instance.between(9, 5) }
          expect_raises(Exception) { instance.between(9, 6) }
          expect_raises(Exception) { instance.between(9, 7) }
          expect_raises(Exception) { instance.between(9, 8) }
          instance.between(9, 9).should eq(10)
        end
      end

      context "Fibonacci sequence" do
        it "returns a value of cumulative product between given indexes." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeProduct(Int32).generate(array)

          instance.between(0, 0).should eq(1)
          instance.between(0, 1).should eq(1)
          instance.between(0, 2).should eq(2)
          instance.between(0, 3).should eq(6)
          instance.between(0, 4).should eq(30)
          instance.between(0, 5).should eq(240)
          instance.between(0, 6).should eq(3_120)
          instance.between(0, 7).should eq(65_520)
          instance.between(0, 8).should eq(2_227_680)
          instance.between(0, 9).should eq(122_522_400)

          expect_raises(Exception) { instance.between(1, 0) }
          instance.between(1, 1).should eq(1)
          instance.between(1, 2).should eq(2)
          instance.between(1, 3).should eq(6)
          instance.between(1, 4).should eq(30)
          instance.between(1, 5).should eq(240)
          instance.between(1, 6).should eq(3_120)
          instance.between(1, 7).should eq(65_520)
          instance.between(1, 8).should eq(2_227_680)
          instance.between(1, 9).should eq(122_522_400)

          expect_raises(Exception) { instance.between(2, 0) }
          expect_raises(Exception) { instance.between(2, 1) }
          instance.between(2, 2).should eq(2)
          instance.between(2, 3).should eq(6)
          instance.between(2, 4).should eq(30)
          instance.between(2, 5).should eq(240)
          instance.between(2, 6).should eq(3_120)
          instance.between(2, 7).should eq(65_520)
          instance.between(2, 8).should eq(2_227_680)
          instance.between(2, 9).should eq(122_522_400)

          expect_raises(Exception) { instance.between(3, 0) }
          expect_raises(Exception) { instance.between(3, 1) }
          expect_raises(Exception) { instance.between(3, 2) }
          instance.between(3, 3).should eq(3)
          instance.between(3, 4).should eq(15)
          instance.between(3, 5).should eq(120)
          instance.between(3, 6).should eq(1_560)
          instance.between(3, 7).should eq(32_760)
          instance.between(3, 8).should eq(1_113_840)
          instance.between(3, 9).should eq(61_261_200)

          expect_raises(Exception) { instance.between(4, 0) }
          expect_raises(Exception) { instance.between(4, 1) }
          expect_raises(Exception) { instance.between(4, 2) }
          expect_raises(Exception) { instance.between(4, 3) }
          instance.between(4, 4).should eq(5)
          instance.between(4, 5).should eq(40)
          instance.between(4, 6).should eq(520)
          instance.between(4, 7).should eq(10_920)
          instance.between(4, 8).should eq(371_280)
          instance.between(4, 9).should eq(20_420_400)

          expect_raises(Exception) { instance.between(5, 0) }
          expect_raises(Exception) { instance.between(5, 1) }
          expect_raises(Exception) { instance.between(5, 2) }
          expect_raises(Exception) { instance.between(5, 3) }
          expect_raises(Exception) { instance.between(5, 4) }
          instance.between(5, 5).should eq(8)
          instance.between(5, 6).should eq(104)
          instance.between(5, 7).should eq(2_184)
          instance.between(5, 8).should eq(74_256)
          instance.between(5, 9).should eq(4_084_080)

          expect_raises(Exception) { instance.between(6, 0) }
          expect_raises(Exception) { instance.between(6, 1) }
          expect_raises(Exception) { instance.between(6, 2) }
          expect_raises(Exception) { instance.between(6, 3) }
          expect_raises(Exception) { instance.between(6, 4) }
          expect_raises(Exception) { instance.between(6, 5) }
          instance.between(6, 6).should eq(13)
          instance.between(6, 7).should eq(273)
          instance.between(6, 8).should eq(9_282)
          instance.between(6, 9).should eq(510_510)

          expect_raises(Exception) { instance.between(7, 0) }
          expect_raises(Exception) { instance.between(7, 1) }
          expect_raises(Exception) { instance.between(7, 2) }
          expect_raises(Exception) { instance.between(7, 3) }
          expect_raises(Exception) { instance.between(7, 4) }
          expect_raises(Exception) { instance.between(7, 5) }
          expect_raises(Exception) { instance.between(7, 6) }
          instance.between(7, 7).should eq(21)
          instance.between(7, 8).should eq(714)
          instance.between(7, 9).should eq(39_270)

          expect_raises(Exception) { instance.between(8, 0) }
          expect_raises(Exception) { instance.between(8, 1) }
          expect_raises(Exception) { instance.between(8, 2) }
          expect_raises(Exception) { instance.between(8, 3) }
          expect_raises(Exception) { instance.between(8, 4) }
          expect_raises(Exception) { instance.between(8, 5) }
          expect_raises(Exception) { instance.between(8, 6) }
          expect_raises(Exception) { instance.between(8, 7) }
          instance.between(8, 8).should eq(34)
          instance.between(8, 9).should eq(1_870)

          expect_raises(Exception) { instance.between(9, 0) }
          expect_raises(Exception) { instance.between(9, 1) }
          expect_raises(Exception) { instance.between(9, 2) }
          expect_raises(Exception) { instance.between(9, 3) }
          expect_raises(Exception) { instance.between(9, 4) }
          expect_raises(Exception) { instance.between(9, 5) }
          expect_raises(Exception) { instance.between(9, 6) }
          expect_raises(Exception) { instance.between(9, 7) }
          expect_raises(Exception) { instance.between(9, 8) }
          instance.between(9, 9).should eq(55)
        end
      end
    end

    context "when .generate is executed with block" do
      mod = 10_007
      inverse_instance = Inverse.generate((mod - 1).to_i64, mod.to_i64)

      context "arithmetic sequence" do
        it "returns a value of cumulative product between given indexes." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeProduct(Int32).generate(array) do |last, i|
            (last * i) % mod
          end

          instance_between(instance, 0, 0, inverse_instance, mod).should eq(1)
          instance_between(instance, 0, 1, inverse_instance, mod).should eq(2)
          instance_between(instance, 0, 2, inverse_instance, mod).should eq(6)
          instance_between(instance, 0, 3, inverse_instance, mod).should eq(24)
          instance_between(instance, 0, 4, inverse_instance, mod).should eq(120)
          instance_between(instance, 0, 5, inverse_instance, mod).should eq(720)
          instance_between(instance, 0, 6, inverse_instance, mod).should eq(5_040)
          instance_between(instance, 0, 7, inverse_instance, mod).should eq(292)
          instance_between(instance, 0, 8, inverse_instance, mod).should eq(2_628)
          instance_between(instance, 0, 9, inverse_instance, mod).should eq(6_266)

          expect_raises(Exception) { instance_between(instance, 1, 0, inverse_instance, mod) }
          instance_between(instance, 1, 1, inverse_instance, mod).should eq(2)
          instance_between(instance, 1, 2, inverse_instance, mod).should eq(6)
          instance_between(instance, 1, 3, inverse_instance, mod).should eq(24)
          instance_between(instance, 1, 4, inverse_instance, mod).should eq(120)
          instance_between(instance, 1, 5, inverse_instance, mod).should eq(720)
          instance_between(instance, 1, 6, inverse_instance, mod).should eq(5_040)
          instance_between(instance, 1, 7, inverse_instance, mod).should eq(292)
          instance_between(instance, 1, 8, inverse_instance, mod).should eq(2_628)
          instance_between(instance, 1, 9, inverse_instance, mod).should eq(6_266)

          expect_raises(Exception) { instance_between(instance, 2, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 2, 1, inverse_instance, mod) }
          instance_between(instance, 2, 2, inverse_instance, mod).should eq(3)
          instance_between(instance, 2, 3, inverse_instance, mod).should eq(12)
          instance_between(instance, 2, 4, inverse_instance, mod).should eq(60)
          instance_between(instance, 2, 5, inverse_instance, mod).should eq(360)
          instance_between(instance, 2, 6, inverse_instance, mod).should eq(2_520)
          instance_between(instance, 2, 7, inverse_instance, mod).should eq(146)
          instance_between(instance, 2, 8, inverse_instance, mod).should eq(1_314)
          instance_between(instance, 2, 9, inverse_instance, mod).should eq(3_133)

          expect_raises(Exception) { instance_between(instance, 3, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 3, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 3, 2, inverse_instance, mod) }
          instance_between(instance, 3, 3, inverse_instance, mod).should eq(4)
          instance_between(instance, 3, 4, inverse_instance, mod).should eq(20)
          instance_between(instance, 3, 5, inverse_instance, mod).should eq(120)
          instance_between(instance, 3, 6, inverse_instance, mod).should eq(840)
          instance_between(instance, 3, 7, inverse_instance, mod).should eq(6_720)
          instance_between(instance, 3, 8, inverse_instance, mod).should eq(438)
          instance_between(instance, 3, 9, inverse_instance, mod).should eq(4_380)

          expect_raises(Exception) { instance_between(instance, 4, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 4, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 4, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 4, 3, inverse_instance, mod) }
          instance_between(instance, 4, 4, inverse_instance, mod).should eq(5)
          instance_between(instance, 4, 5, inverse_instance, mod).should eq(30)
          instance_between(instance, 4, 6, inverse_instance, mod).should eq(210)
          instance_between(instance, 4, 7, inverse_instance, mod).should eq(1_680)
          instance_between(instance, 4, 8, inverse_instance, mod).should eq(5_113)
          instance_between(instance, 4, 9, inverse_instance, mod).should eq(1_095)

          expect_raises(Exception) { instance_between(instance, 5, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 4, inverse_instance, mod) }
          instance_between(instance, 5, 5, inverse_instance, mod).should eq(6)
          instance_between(instance, 5, 6, inverse_instance, mod).should eq(42)
          instance_between(instance, 5, 7, inverse_instance, mod).should eq(336)
          instance_between(instance, 5, 8, inverse_instance, mod).should eq(3_024)
          instance_between(instance, 5, 9, inverse_instance, mod).should eq(219)

          expect_raises(Exception) { instance_between(instance, 6, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 5, inverse_instance, mod) }
          instance_between(instance, 6, 6, inverse_instance, mod).should eq(7)
          instance_between(instance, 6, 7, inverse_instance, mod).should eq(56)
          instance_between(instance, 6, 8, inverse_instance, mod).should eq(504)
          instance_between(instance, 6, 9, inverse_instance, mod).should eq(5_040)

          expect_raises(Exception) { instance_between(instance, 7, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 5, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 6, inverse_instance, mod) }
          instance_between(instance, 7, 7, inverse_instance, mod).should eq(8)
          instance_between(instance, 7, 8, inverse_instance, mod).should eq(72)
          instance_between(instance, 7, 9, inverse_instance, mod).should eq(720)

          expect_raises(Exception) { instance_between(instance, 8, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 5, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 6, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 7, inverse_instance, mod) }
          instance_between(instance, 8, 8, inverse_instance, mod).should eq(9)
          instance_between(instance, 8, 9, inverse_instance, mod).should eq(90)

          expect_raises(Exception) { instance_between(instance, 9, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 5, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 6, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 7, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 8, inverse_instance, mod) }
          instance_between(instance, 9, 9, inverse_instance, mod).should eq(10)
        end
      end

      context "Fibonacci sequence" do
        it "returns a value of cumulative product between given indexes." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeProduct(Int32).generate(array) do |last, i|
            (last * i) % mod
          end

          instance_between(instance, 0, 0, inverse_instance, mod).should eq(1)
          instance_between(instance, 0, 1, inverse_instance, mod).should eq(1)
          instance_between(instance, 0, 2, inverse_instance, mod).should eq(2)
          instance_between(instance, 0, 3, inverse_instance, mod).should eq(6)
          instance_between(instance, 0, 4, inverse_instance, mod).should eq(30)
          instance_between(instance, 0, 5, inverse_instance, mod).should eq(240)
          instance_between(instance, 0, 6, inverse_instance, mod).should eq(3_120)
          instance_between(instance, 0, 7, inverse_instance, mod).should eq(5_478)
          instance_between(instance, 0, 8, inverse_instance, mod).should eq(6_126)
          instance_between(instance, 0, 9, inverse_instance, mod).should eq(6_699)

          expect_raises(Exception) { instance_between(instance, 1, 0, inverse_instance, mod) }
          instance_between(instance, 1, 1, inverse_instance, mod).should eq(1)
          instance_between(instance, 1, 2, inverse_instance, mod).should eq(2)
          instance_between(instance, 1, 3, inverse_instance, mod).should eq(6)
          instance_between(instance, 1, 4, inverse_instance, mod).should eq(30)
          instance_between(instance, 1, 5, inverse_instance, mod).should eq(240)
          instance_between(instance, 1, 6, inverse_instance, mod).should eq(3_120)
          instance_between(instance, 1, 7, inverse_instance, mod).should eq(5_478)
          instance_between(instance, 1, 8, inverse_instance, mod).should eq(6_126)
          instance_between(instance, 1, 9, inverse_instance, mod).should eq(6_699)

          expect_raises(Exception) { instance_between(instance, 2, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 2, 1, inverse_instance, mod) }
          instance_between(instance, 2, 2, inverse_instance, mod).should eq(2)
          instance_between(instance, 2, 3, inverse_instance, mod).should eq(6)
          instance_between(instance, 2, 4, inverse_instance, mod).should eq(30)
          instance_between(instance, 2, 5, inverse_instance, mod).should eq(240)
          instance_between(instance, 2, 6, inverse_instance, mod).should eq(3_120)
          instance_between(instance, 2, 7, inverse_instance, mod).should eq(5_478)
          instance_between(instance, 2, 8, inverse_instance, mod).should eq(6_126)
          instance_between(instance, 2, 9, inverse_instance, mod).should eq(6_699)

          expect_raises(Exception) { instance_between(instance, 3, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 3, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 3, 2, inverse_instance, mod) }
          instance_between(instance, 3, 3, inverse_instance, mod).should eq(3)
          instance_between(instance, 3, 4, inverse_instance, mod).should eq(15)
          instance_between(instance, 3, 5, inverse_instance, mod).should eq(120)
          instance_between(instance, 3, 6, inverse_instance, mod).should eq(1_560)
          instance_between(instance, 3, 7, inverse_instance, mod).should eq(2_739)
          instance_between(instance, 3, 8, inverse_instance, mod).should eq(3_063)
          instance_between(instance, 3, 9, inverse_instance, mod).should eq(8_353)

          expect_raises(Exception) { instance_between(instance, 4, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 4, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 4, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 4, 3, inverse_instance, mod) }
          instance_between(instance, 4, 4, inverse_instance, mod).should eq(5)
          instance_between(instance, 4, 5, inverse_instance, mod).should eq(40)
          instance_between(instance, 4, 6, inverse_instance, mod).should eq(520)
          instance_between(instance, 4, 7, inverse_instance, mod).should eq(913)
          instance_between(instance, 4, 8, inverse_instance, mod).should eq(1_021)
          instance_between(instance, 4, 9, inverse_instance, mod).should eq(6_120)

          expect_raises(Exception) { instance_between(instance, 5, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 5, 4, inverse_instance, mod) }
          instance_between(instance, 5, 5, inverse_instance, mod).should eq(8)
          instance_between(instance, 5, 6, inverse_instance, mod).should eq(104)
          instance_between(instance, 5, 7, inverse_instance, mod).should eq(2_184)
          instance_between(instance, 5, 8, inverse_instance, mod).should eq(4_207)
          instance_between(instance, 5, 9, inverse_instance, mod).should eq(1_224)

          expect_raises(Exception) { instance_between(instance, 6, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 6, 5, inverse_instance, mod) }
          instance_between(instance, 6, 6, inverse_instance, mod).should eq(13)
          instance_between(instance, 6, 7, inverse_instance, mod).should eq(273)
          instance_between(instance, 6, 8, inverse_instance, mod).should eq(9_282)
          instance_between(instance, 6, 9, inverse_instance, mod).should eq(153)

          expect_raises(Exception) { instance_between(instance, 7, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 5, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 7, 6, inverse_instance, mod) }
          instance_between(instance, 7, 7, inverse_instance, mod).should eq(21)
          instance_between(instance, 7, 8, inverse_instance, mod).should eq(714)
          instance_between(instance, 7, 9, inverse_instance, mod).should eq(9_249)

          expect_raises(Exception) { instance_between(instance, 8, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 5, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 6, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 8, 7, inverse_instance, mod) }
          instance_between(instance, 8, 8, inverse_instance, mod).should eq(34)
          instance_between(instance, 8, 9, inverse_instance, mod).should eq(1_870)

          expect_raises(Exception) { instance_between(instance, 9, 0, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 1, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 2, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 3, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 4, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 5, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 6, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 7, inverse_instance, mod) }
          expect_raises(Exception) { instance_between(instance, 9, 8, inverse_instance, mod) }
          instance_between(instance, 9, 9, inverse_instance, mod).should eq(55)
        end
      end
    end
  end
end
