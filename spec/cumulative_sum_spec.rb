require_relative './../../_algorithm/cumulative_sum'

describe CumulativeSum do
  describe '#calc' do
    let :instance do
      CumulativeSum.new(array)
    end

    context 'without block' do
      subject do
        instance.calc
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
        instance.calc { |last, i| (last + i) % 3 }
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

  describe '.calc (class method)' do
    context 'without block' do
      subject do
        CumulativeSum.calc(array)
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
        CumulativeSum.calc(array) do |last, i|
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
