require "spec"
require "./../lib/cumulative_sum"

describe CumulativeSum do
  describe "#calc" do
    context "without block" do
      context "arithmetic sequence" do
        it "returns array of cumulative sum" do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

          CumulativeSum.new(array).calc.should \
            eq([0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum" do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

          CumulativeSum.new(array).calc.should \
            eq([0, 1, 2, 4, 7, 12, 20, 33, 54, 88, 143])
        end
      end
    end

    context "with block" do
      context "arithmetic sequence" do
        it "returns array of cumulative sum calculated by logic in given block" do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

          CumulativeSum.new(array).calc { |last, i| (last + i) % 3 }.should \
            eq([0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum calculated by logic in given block" do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

          CumulativeSum.new(array).calc { |last, i| (last + i) % 3 }.should \
            eq([0, 1, 2, 1, 1, 0, 2, 0, 0, 1, 2])
        end
      end
    end
  end

  describe ".calc (class method)" do
    context "without block" do
      context "arithmetic sequence" do
        it "returns array of cumulative sum" do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

          CumulativeSum.calc(array).should \
            eq([0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum" do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

          CumulativeSum.calc(array).should \
            eq([0, 1, 2, 4, 7, 12, 20, 33, 54, 88, 143])
        end
      end
    end

    context "with block" do
      context "arithmetic sequence" do
        it "returns array of cumulative sum calculated by logic in given block" do
          array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

          result = CumulativeSum.calc(array) do |last, i|
            (last + i) % 3
          end

          result.should \
            eq([0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1])
        end
      end

      context "Fibonacci sequence" do
        it "returns array of cumulative sum calculated by logic in given block" do
          array = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

          result = CumulativeSum.calc(array) do |last, i|
            (last + i) % 3
          end

          result.should \
            eq([0, 1, 2, 1, 1, 0, 2, 0, 0, 1, 2])
        end
      end
    end
  end
end
