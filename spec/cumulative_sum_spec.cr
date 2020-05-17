require "spec"
require "./../lib/cumulative_caluculation"

describe CumulativeSum do
  describe ".generate (class method)" do
    context "when executed without block" do
      context "arithmetic sequence" do
        it "returns an instance of CumulativeSum." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeSum(Int32).generate(array)

          be_a(CumulativeSum(Int32)) { instance }
        end
      end

      context "Fibonacci sequence" do
        it "returns an instance of CumulativeSum." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeSum(Int32).generate(array)

          be_a(CumulativeSum(Int32)) { instance }
        end
      end
    end

    context "when executed with block" do
      mod = 3

      context "arithmetic sequence" do
        it "returns an instance of CumulativeSum." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeSum(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          be_a(CumulativeSum(Int32)) { instance }
        end
      end

      context "Fibonacci sequence" do
        it "returns an instance of CumulativeSum." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeSum(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          be_a(CumulativeSum(Int32)) { instance }
        end
      end
    end
  end

  describe "#result" do
    context "when .generate is executed without block" do
      context "arithmetic sequence" do
        it "returns array of cumulative sum." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeSum(Int32).generate(array)

          instance.result.should \
            eq([0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeSum(Int32).generate(array)

          instance.result.should \
            eq([0, 1, 2, 4, 7, 12, 20, 33, 54, 88, 143])
        end
      end
    end

    context "when .generate is executed with block" do
      mod = 3

      context "arithmetic sequence" do
        it "returns array of cumulative sum calculated by logic in given block." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeSum(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          instance.result.should \
            eq([0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum calculated by logic in given block." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeSum(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          instance.result.should \
            eq([0, 1, 2, 1, 1, 0, 2, 0, 0, 1, 2])
        end
      end
    end
  end

  describe "#between" do
    context "when .generate is executed without block" do
      context "arithmetic sequence" do
        it "returns a value of cumulative sum between given indexes." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeSum(Int32).generate(array)

          instance.between(0, 0).should eq(1)
          instance.between(0, 1).should eq(3)
          instance.between(0, 2).should eq(6)
          instance.between(0, 3).should eq(10)
          instance.between(0, 4).should eq(15)
          instance.between(0, 5).should eq(21)
          instance.between(0, 6).should eq(28)
          instance.between(0, 7).should eq(36)
          instance.between(0, 8).should eq(45)
          instance.between(0, 9).should eq(55)

          expect_raises(Exception) { instance.between(1, 0) }
          instance.between(1, 1).should eq(2)
          instance.between(1, 2).should eq(5)
          instance.between(1, 3).should eq(9)
          instance.between(1, 4).should eq(14)
          instance.between(1, 5).should eq(20)
          instance.between(1, 6).should eq(27)
          instance.between(1, 7).should eq(35)
          instance.between(1, 8).should eq(44)
          instance.between(1, 9).should eq(54)

          expect_raises(Exception) { instance.between(2, 0) }
          expect_raises(Exception) { instance.between(2, 1) }
          instance.between(2, 2).should eq(3)
          instance.between(2, 3).should eq(7)
          instance.between(2, 4).should eq(12)
          instance.between(2, 5).should eq(18)
          instance.between(2, 6).should eq(25)
          instance.between(2, 7).should eq(33)
          instance.between(2, 8).should eq(42)
          instance.between(2, 9).should eq(52)

          expect_raises(Exception) { instance.between(3, 0) }
          expect_raises(Exception) { instance.between(3, 1) }
          expect_raises(Exception) { instance.between(3, 2) }
          instance.between(3, 3).should eq(4)
          instance.between(3, 4).should eq(9)
          instance.between(3, 5).should eq(15)
          instance.between(3, 6).should eq(22)
          instance.between(3, 7).should eq(30)
          instance.between(3, 8).should eq(39)
          instance.between(3, 9).should eq(49)

          expect_raises(Exception) { instance.between(4, 0) }
          expect_raises(Exception) { instance.between(4, 1) }
          expect_raises(Exception) { instance.between(4, 2) }
          expect_raises(Exception) { instance.between(4, 3) }
          instance.between(4, 4).should eq(5)
          instance.between(4, 5).should eq(11)
          instance.between(4, 6).should eq(18)
          instance.between(4, 7).should eq(26)
          instance.between(4, 8).should eq(35)
          instance.between(4, 9).should eq(45)

          expect_raises(Exception) { instance.between(5, 0) }
          expect_raises(Exception) { instance.between(5, 1) }
          expect_raises(Exception) { instance.between(5, 2) }
          expect_raises(Exception) { instance.between(5, 3) }
          expect_raises(Exception) { instance.between(5, 4) }
          instance.between(5, 5).should eq(6)
          instance.between(5, 6).should eq(13)
          instance.between(5, 7).should eq(21)
          instance.between(5, 8).should eq(30)
          instance.between(5, 9).should eq(40)

          expect_raises(Exception) { instance.between(6, 0) }
          expect_raises(Exception) { instance.between(6, 1) }
          expect_raises(Exception) { instance.between(6, 2) }
          expect_raises(Exception) { instance.between(6, 3) }
          expect_raises(Exception) { instance.between(6, 4) }
          expect_raises(Exception) { instance.between(6, 5) }
          instance.between(6, 6).should eq(7)
          instance.between(6, 7).should eq(15)
          instance.between(6, 8).should eq(24)
          instance.between(6, 9).should eq(34)

          expect_raises(Exception) { instance.between(7, 0) }
          expect_raises(Exception) { instance.between(7, 1) }
          expect_raises(Exception) { instance.between(7, 2) }
          expect_raises(Exception) { instance.between(7, 3) }
          expect_raises(Exception) { instance.between(7, 4) }
          expect_raises(Exception) { instance.between(7, 5) }
          expect_raises(Exception) { instance.between(7, 6) }
          instance.between(7, 7).should eq(8)
          instance.between(7, 8).should eq(17)
          instance.between(7, 9).should eq(27)

          expect_raises(Exception) { instance.between(8, 0) }
          expect_raises(Exception) { instance.between(8, 1) }
          expect_raises(Exception) { instance.between(8, 2) }
          expect_raises(Exception) { instance.between(8, 3) }
          expect_raises(Exception) { instance.between(8, 4) }
          expect_raises(Exception) { instance.between(8, 5) }
          expect_raises(Exception) { instance.between(8, 6) }
          expect_raises(Exception) { instance.between(8, 7) }
          instance.between(8, 8).should eq(9)
          instance.between(8, 9).should eq(19)

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
        it "returns a value of cumulative sum between given indexes." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeSum(Int32).generate(array)

          instance.between(0, 0).should eq(1)
          instance.between(0, 1).should eq(2)
          instance.between(0, 2).should eq(4)
          instance.between(0, 3).should eq(7)
          instance.between(0, 4).should eq(12)
          instance.between(0, 5).should eq(20)
          instance.between(0, 6).should eq(33)
          instance.between(0, 7).should eq(54)
          instance.between(0, 8).should eq(88)
          instance.between(0, 9).should eq(143)

          expect_raises(Exception) { instance.between(1, 0) }
          instance.between(1, 1).should eq(1)
          instance.between(1, 2).should eq(3)
          instance.between(1, 3).should eq(6)
          instance.between(1, 4).should eq(11)
          instance.between(1, 5).should eq(19)
          instance.between(1, 6).should eq(32)
          instance.between(1, 7).should eq(53)
          instance.between(1, 8).should eq(87)
          instance.between(1, 9).should eq(142)

          expect_raises(Exception) { instance.between(2, 0) }
          expect_raises(Exception) { instance.between(2, 1) }
          instance.between(2, 2).should eq(2)
          instance.between(2, 3).should eq(5)
          instance.between(2, 4).should eq(10)
          instance.between(2, 5).should eq(18)
          instance.between(2, 6).should eq(31)
          instance.between(2, 7).should eq(52)
          instance.between(2, 8).should eq(86)
          instance.between(2, 9).should eq(141)

          expect_raises(Exception) { instance.between(3, 0) }
          expect_raises(Exception) { instance.between(3, 1) }
          expect_raises(Exception) { instance.between(3, 2) }
          instance.between(3, 3).should eq(3)
          instance.between(3, 4).should eq(8)
          instance.between(3, 5).should eq(16)
          instance.between(3, 6).should eq(29)
          instance.between(3, 7).should eq(50)
          instance.between(3, 8).should eq(84)
          instance.between(3, 9).should eq(139)

          expect_raises(Exception) { instance.between(4, 0) }
          expect_raises(Exception) { instance.between(4, 1) }
          expect_raises(Exception) { instance.between(4, 2) }
          expect_raises(Exception) { instance.between(4, 3) }
          instance.between(4, 4).should eq(5)
          instance.between(4, 5).should eq(13)
          instance.between(4, 6).should eq(26)
          instance.between(4, 7).should eq(47)
          instance.between(4, 8).should eq(81)
          instance.between(4, 9).should eq(136)

          expect_raises(Exception) { instance.between(5, 0) }
          expect_raises(Exception) { instance.between(5, 1) }
          expect_raises(Exception) { instance.between(5, 2) }
          expect_raises(Exception) { instance.between(5, 3) }
          expect_raises(Exception) { instance.between(5, 4) }
          instance.between(5, 5).should eq(8)
          instance.between(5, 6).should eq(21)
          instance.between(5, 7).should eq(42)
          instance.between(5, 8).should eq(76)
          instance.between(5, 9).should eq(131)

          expect_raises(Exception) { instance.between(6, 0) }
          expect_raises(Exception) { instance.between(6, 1) }
          expect_raises(Exception) { instance.between(6, 2) }
          expect_raises(Exception) { instance.between(6, 3) }
          expect_raises(Exception) { instance.between(6, 4) }
          expect_raises(Exception) { instance.between(6, 5) }
          instance.between(6, 6).should eq(13)
          instance.between(6, 7).should eq(34)
          instance.between(6, 8).should eq(68)
          instance.between(6, 9).should eq(123)

          expect_raises(Exception) { instance.between(7, 0) }
          expect_raises(Exception) { instance.between(7, 1) }
          expect_raises(Exception) { instance.between(7, 2) }
          expect_raises(Exception) { instance.between(7, 3) }
          expect_raises(Exception) { instance.between(7, 4) }
          expect_raises(Exception) { instance.between(7, 5) }
          expect_raises(Exception) { instance.between(7, 6) }
          instance.between(7, 7).should eq(21)
          instance.between(7, 8).should eq(55)
          instance.between(7, 9).should eq(110)

          expect_raises(Exception) { instance.between(8, 0) }
          expect_raises(Exception) { instance.between(8, 1) }
          expect_raises(Exception) { instance.between(8, 2) }
          expect_raises(Exception) { instance.between(8, 3) }
          expect_raises(Exception) { instance.between(8, 4) }
          expect_raises(Exception) { instance.between(8, 5) }
          expect_raises(Exception) { instance.between(8, 6) }
          expect_raises(Exception) { instance.between(8, 7) }
          instance.between(8, 8).should eq(34)
          instance.between(8, 9).should eq(89)

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
      mod = 3

      context "arithmetic sequence" do
        it "returns a value of cumulative sum between given indexes." do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          instance = CumulativeSum(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          instance.between(0, 0) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(0, 1) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 2) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 3) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(0, 4) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 5) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 6) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(0, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(1, 0) { |a, b| (b - a) % mod } }
          instance.between(1, 1) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 2) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 3) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(1, 4) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 5) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 6) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(1, 7) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 8) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 9) { |a, b| (b - a) % mod }.should eq(0)

          expect_raises(Exception) { instance.between(2, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(2, 1) { |a, b| (b - a) % mod } }
          instance.between(2, 2) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(2, 3) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(2, 4) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(2, 5) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(2, 6) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(2, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(2, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(2, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(3, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(3, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(3, 2) { |a, b| (b - a) % mod } }
          instance.between(3, 3) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(3, 4) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(3, 5) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(3, 6) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(3, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(3, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(3, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(4, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(4, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(4, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(4, 3) { |a, b| (b - a) % mod } }
          instance.between(4, 4) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(4, 5) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(4, 6) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(4, 7) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(4, 8) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(4, 9) { |a, b| (b - a) % mod }.should eq(0)

          expect_raises(Exception) { instance.between(5, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 4) { |a, b| (b - a) % mod } }
          instance.between(5, 5) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(5, 6) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(5, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(5, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(5, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(6, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 5) { |a, b| (b - a) % mod } }
          instance.between(6, 6) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(6, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(6, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(6, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(7, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 5) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 6) { |a, b| (b - a) % mod } }
          instance.between(7, 7) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(7, 8) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(7, 9) { |a, b| (b - a) % mod }.should eq(0)

          expect_raises(Exception) { instance.between(8, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 5) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 6) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 7) { |a, b| (b - a) % mod } }
          instance.between(8, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(8, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(9, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 5) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 6) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 7) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 8) { |a, b| (b - a) % mod } }
          instance.between(9, 9) { |a, b| (b - a) % mod }.should eq(1)
        end
      end

      context "Fibonacci sequence" do
        it "returns a value of cumulative sum between given indexes." do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
          instance = CumulativeSum(Int32).generate(array) do |last, i|
            (last + i) % mod
          end

          instance.between(0, 0) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(0, 1) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(0, 2) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(0, 3) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(0, 4) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 5) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(0, 6) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(0, 8) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(0, 9) { |a, b| (b - a) % mod }.should eq(2)

          expect_raises(Exception) { instance.between(1, 0) { |a, b| (b - a) % mod } }
          instance.between(1, 1) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(1, 2) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(1, 3) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(1, 4) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 5) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(1, 6) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 7) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(1, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(1, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(2, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(2, 1) { |a, b| (b - a) % mod } }
          instance.between(2, 2) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(2, 3) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(2, 4) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(2, 5) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(2, 6) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(2, 7) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(2, 8) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(2, 9) { |a, b| (b - a) % mod }.should eq(0)

          expect_raises(Exception) { instance.between(3, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(3, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(3, 2) { |a, b| (b - a) % mod } }
          instance.between(3, 3) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(3, 4) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(3, 5) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(3, 6) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(3, 7) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(3, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(3, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(4, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(4, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(4, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(4, 3) { |a, b| (b - a) % mod } }
          instance.between(4, 4) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(4, 5) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(4, 6) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(4, 7) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(4, 8) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(4, 9) { |a, b| (b - a) % mod }.should eq(1)

          expect_raises(Exception) { instance.between(5, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(5, 4) { |a, b| (b - a) % mod } }
          instance.between(5, 5) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(5, 6) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(5, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(5, 8) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(5, 9) { |a, b| (b - a) % mod }.should eq(2)

          expect_raises(Exception) { instance.between(6, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(6, 5) { |a, b| (b - a) % mod } }
          instance.between(6, 6) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(6, 7) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(6, 8) { |a, b| (b - a) % mod }.should eq(2)
          instance.between(6, 9) { |a, b| (b - a) % mod }.should eq(0)

          expect_raises(Exception) { instance.between(7, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 5) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(7, 6) { |a, b| (b - a) % mod } }
          instance.between(7, 7) { |a, b| (b - a) % mod }.should eq(0)
          instance.between(7, 8) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(7, 9) { |a, b| (b - a) % mod }.should eq(2)

          expect_raises(Exception) { instance.between(8, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 5) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 6) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(8, 7) { |a, b| (b - a) % mod } }
          instance.between(8, 8) { |a, b| (b - a) % mod }.should eq(1)
          instance.between(8, 9) { |a, b| (b - a) % mod }.should eq(2)

          expect_raises(Exception) { instance.between(9, 0) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 1) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 2) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 3) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 4) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 5) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 6) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 7) { |a, b| (b - a) % mod } }
          expect_raises(Exception) { instance.between(9, 8) { |a, b| (b - a) % mod } }
          instance.between(9, 9) { |a, b| (b - a) % mod }.should eq(1)
        end
      end
    end
  end
end
