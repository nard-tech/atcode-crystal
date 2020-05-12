require_relative './../lib/cumulative_sum'

describe CumulativeSum do
  describe '.calc (class method)' do
    context 'without block' do
      subject do
        described_class.calc(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative sum' do
          is_expected.to eq([0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative sum' do
          is_expected.to eq([0, 1, 2, 4, 7, 12, 20, 33, 54, 88, 143])
        end
      end
    end

    context 'with block' do
      subject do
        described_class.calc(array) do |last, i|
          (last + i) % 3
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative sum calculated by logic in given block' do
          is_expected.to eq([0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative sum calculated by logic in given block' do
          is_expected.to eq([0, 1, 2, 1, 1, 0, 2, 0, 0, 1, 2])
        end
      end
    end
  end
end

describe CumulativeProduct do
  describe '.calc (class method)' do
    context 'without block' do
      subject do
        described_class.calc(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative sum' do
          is_expected.to eq([1, 1, 2, 6, 24, 120, 720, 5_040, 40_320, 362_880, 3_628_800])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative sum' do
          is_expected.to eq([1, 1, 1, 2, 6, 30, 240, 3_120, 65_520, 2_227_680, 122_522_400])
        end
      end
    end

    context 'with block' do
      let :mod do
        10_007
      end

      subject do
        described_class.calc(array) do |last, i|
          (last * i) % mod
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative sum calculated by logic in given block' do
          is_expected.to eq([1, 1, 2, 6, 24, 120, 720, 5_040, 292, 2628, 6266])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative sum calculated by logic in given block' do
          is_expected.to eq([1, 1, 1, 2, 6, 30, 240, 3_120, 5478, 6126, 6699])
        end
      end
    end
  end
end
