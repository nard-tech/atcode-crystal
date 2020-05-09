require "./../../../lib/integer/factorial_and_combination"

describe Combination do
  mod = 10_i64**9 + 7

  describe ".calc" do
    context "n is less than 0" do
      context "k is less than 0" do
        it "returns 0" do
          Combination.calc(-1_i64, -1_i64, mod).should eq(0_i64)

          Combination.calc(-2_i64, -1_i64, mod).should eq(0_i64)
          Combination.calc(-100_i64, -1_i64, mod).should eq(0_i64)

          Combination.calc(-1_i64, -2_i64, mod).should eq(0_i64)
          Combination.calc(-1_i64, -100_i64, mod).should eq(0_i64)
        end
      end

      context "k is 0" do
        it "returns 0" do
          Combination.calc(-1_i64, 0_i64, mod).should eq(0_i64)
          Combination.calc(-2_i64, 0_i64, mod).should eq(0_i64)

          Combination.calc(-100_i64, 0_i64, mod).should eq(0_i64)
        end
      end

      context "k is greater than 0" do
        it "returns 0" do
          Combination.calc(-1_i64, 1_i64, mod).should eq(0_i64)
          Combination.calc(-2_i64, 1_i64, mod).should eq(0_i64)

          Combination.calc(-100_i64, 1_i64, mod).should eq(0_i64)

          Combination.calc(-1_i64, 100_i64, mod).should eq(0_i64)
          Combination.calc(-2_i64, 100_i64, mod).should eq(0_i64)

          Combination.calc(-100_i64, 100_i64, mod).should eq(0_i64)
        end
      end
    end

    context "n is 0" do
      context "k is less than 0" do
        it "returns 0" do
          Combination.calc(0_i64, -1_i64, mod).should eq(0_i64)
          Combination.calc(0_i64, -100_i64, mod).should eq(0_i64)
        end
      end

      context "k is 0" do
        it "returns 0" do
          Combination.calc(0_i64, 0_i64, mod).should eq(1_i64)
        end
      end

      context "k is greater than 0" do
        it "returns 0" do
          Combination.calc(0, 1, mod).should eq(0)
          Combination.calc(0, 100, mod).should eq(0)
        end
      end
    end

    context "n is greater than 0" do
      context "k is less than 0" do
        it "returns 0" do
          Combination.calc(1_i64, -1_i64, mod).should eq(0_i64)
          Combination.calc(2_i64, -1_i64, mod).should eq(0_i64)
          Combination.calc(100_i64, -1_i64, mod).should eq(0_i64)

          Combination.calc(1_i64, -100_i64, mod).should eq(0_i64)
          Combination.calc(2_i64, -100_i64, mod).should eq(0_i64)
          Combination.calc(100_i64, -100_i64, mod).should eq(0_i64)
        end
      end

      context "k is 0" do
        it "returns 1" do
          Combination.calc(1_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(2_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(3_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(4_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(5_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(6_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(7_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(8_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(9_i64, 0_i64, mod).should eq(1_i64)
          Combination.calc(10_i64, 0_i64, mod).should eq(1_i64)

          Combination.calc(100_i64, 0_i64, mod).should eq(1_i64)
        end
      end

      context "k is greater than 0" do
        context "k is 1" do
          it "returns n" do
            Combination.calc(1_i64, 1_i64, mod).should eq(1_i64)
            Combination.calc(2_i64, 1_i64, mod).should eq(2_i64)
            Combination.calc(3_i64, 1_i64, mod).should eq(3_i64)
            Combination.calc(4_i64, 1_i64, mod).should eq(4_i64)
            Combination.calc(5_i64, 1_i64, mod).should eq(5_i64)
            Combination.calc(6_i64, 1_i64, mod).should eq(6_i64)
            Combination.calc(7_i64, 1_i64, mod).should eq(7_i64)
            Combination.calc(8_i64, 1_i64, mod).should eq(8_i64)
            Combination.calc(9_i64, 1_i64, mod).should eq(9_i64)
            Combination.calc(10_i64, 1_i64, mod).should eq(10_i64)

            Combination.calc(100_i64, 1_i64, mod).should eq(100_i64)
          end
        end

        context "k is greater than 1 and less than n - 1" do
          it "returns number of combinations" do
            Combination.calc(4_i64, 2_i64, mod).should eq(6_i64)

            Combination.calc(5_i64, 2_i64, mod).should eq(10_i64)
            Combination.calc(5_i64, 3_i64, mod).should eq(10_i64)

            Combination.calc(6_i64, 2_i64, mod).should eq(15_i64)
            Combination.calc(6_i64, 3_i64, mod).should eq(20_i64)
            Combination.calc(6_i64, 4_i64, mod).should eq(15_i64)

            Combination.calc(7_i64, 2_i64, mod).should eq(21_i64)
            Combination.calc(7_i64, 3_i64, mod).should eq(35_i64)
            Combination.calc(7_i64, 4_i64, mod).should eq(35_i64)
            Combination.calc(7_i64, 5_i64, mod).should eq(21_i64)

            Combination.calc(8_i64, 2_i64, mod).should eq(28_i64)
            Combination.calc(8_i64, 3_i64, mod).should eq(56_i64)
            Combination.calc(8_i64, 4_i64, mod).should eq(70_i64)
            Combination.calc(8_i64, 5_i64, mod).should eq(56_i64)
            Combination.calc(8_i64, 6_i64, mod).should eq(28_i64)

            Combination.calc(9_i64, 2_i64, mod).should eq(36_i64)
            Combination.calc(9_i64, 3_i64, mod).should eq(84_i64)
            Combination.calc(9_i64, 4_i64, mod).should eq(126_i64)
            Combination.calc(9_i64, 5_i64, mod).should eq(126_i64)
            Combination.calc(9_i64, 6_i64, mod).should eq(84_i64)
            Combination.calc(9_i64, 7_i64, mod).should eq(36_i64)

            Combination.calc(10_i64, 2_i64, mod).should eq(45_i64)
            Combination.calc(10_i64, 3_i64, mod).should eq(120_i64)
            Combination.calc(10_i64, 4_i64, mod).should eq(210_i64)
            Combination.calc(10_i64, 5_i64, mod).should eq(252_i64)
            Combination.calc(10_i64, 6_i64, mod).should eq(210_i64)
            Combination.calc(10_i64, 7_i64, mod).should eq(120_i64)
            Combination.calc(10_i64, 8_i64, mod).should eq(45_i64)

            # --------

            Combination.calc(100_i64, 2_i64, mod).should eq(4_950_i64)
            Combination.calc(100_i64, 3_i64, mod).should eq(161_700_i64)
            Combination.calc(100_i64, 4_i64, mod).should eq(3_921_225_i64)
            Combination.calc(100_i64, 5_i64, mod).should eq(75_287_520_i64)
            Combination.calc(100_i64, 6_i64, mod).should eq(192_052_393_i64)
            Combination.calc(100_i64, 7_i64, mod).should eq(7_560_688_i64)
            Combination.calc(100_i64, 8_i64, mod).should eq(87_892_998_i64)
            Combination.calc(100_i64, 9_i64, mod).should eq(231_795_086_i64)
            Combination.calc(100_i64, 10_i64, mod).should eq(309_335_270_i64)

            Combination.calc(100_i64, 50_i64, mod).should eq(538_992_043_i64)

            Combination.calc(100_i64, 90_i64, mod).should eq(309_335_270_i64)
            Combination.calc(100_i64, 91_i64, mod).should eq(231_795_086_i64)
            Combination.calc(100_i64, 92_i64, mod).should eq(87_892_998_i64)
            Combination.calc(100_i64, 93_i64, mod).should eq(7_560_688_i64)
            Combination.calc(100_i64, 94_i64, mod).should eq(192_052_393_i64)
            Combination.calc(100_i64, 95_i64, mod).should eq(75_287_520_i64)
            Combination.calc(100_i64, 96_i64, mod).should eq(3_921_225_i64)
            Combination.calc(100_i64, 97_i64, mod).should eq(161_700_i64)
            Combination.calc(100_i64, 98_i64, mod).should eq(4_950_i64)
          end
        end

        context "k is n - 1" do
          it "returns n" do
            Combination.calc(1_i64, 0_i64, mod).should eq(1_i64)
            Combination.calc(2_i64, 1_i64, mod).should eq(2_i64)
            Combination.calc(3_i64, 2_i64, mod).should eq(3_i64)
            Combination.calc(4_i64, 3_i64, mod).should eq(4_i64)
            Combination.calc(5_i64, 4_i64, mod).should eq(5_i64)
            Combination.calc(6_i64, 5_i64, mod).should eq(6_i64)
            Combination.calc(7_i64, 6_i64, mod).should eq(7_i64)
            Combination.calc(8_i64, 7_i64, mod).should eq(8_i64)
            Combination.calc(9_i64, 8_i64, mod).should eq(9_i64)
            Combination.calc(10_i64, 9_i64, mod).should eq(10_i64)

            Combination.calc(100_i64, 99_i64, mod).should eq(100_i64)
          end
        end

        context "k is n" do
          it "returns 1" do
            Combination.calc(1_i64, 1_i64, mod).should eq(1_i64)
            Combination.calc(2_i64, 2_i64, mod).should eq(1_i64)
            Combination.calc(3_i64, 3_i64, mod).should eq(1_i64)
            Combination.calc(4_i64, 4_i64, mod).should eq(1_i64)
            Combination.calc(5_i64, 5_i64, mod).should eq(1_i64)
            Combination.calc(6_i64, 6_i64, mod).should eq(1_i64)
            Combination.calc(7_i64, 7_i64, mod).should eq(1_i64)
            Combination.calc(8_i64, 8_i64, mod).should eq(1_i64)
            Combination.calc(9_i64, 9_i64, mod).should eq(1_i64)
            Combination.calc(10_i64, 10_i64, mod).should eq(1_i64)

            Combination.calc(100_i64, 100_i64, mod).should eq(1_i64)
          end
        end

        context "k is greater than n" do
          it "returns 0" do
            Combination.calc(1_i64, 2_i64, mod).should eq(0_i64)
            Combination.calc(2_i64, 3_i64, mod).should eq(0_i64)

            Combination.calc(1_i64, 100_i64, mod).should eq(0_i64)
            Combination.calc(2_i64, 100_i64, mod).should eq(0_i64)

            Combination.calc(100_i64, 101_i64, mod).should eq(0_i64)
          end
        end
      end
    end
  end
end
