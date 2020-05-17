# frozen_string_literal: true

require_relative './../lib/cumulative_sum'
require_relative './../lib/integer/factorial_and_combination'

def instance_between(instance, i, j, inverse_instance, mod)
  instance.between(i, j) do |a, b|
    a_inverse = inverse_instance.get(a)
    (b * a_inverse) % mod
  end
end

describe CumulativeSum do
  describe '.generate (class method)' do
    context 'when .generate is executed without block' do
      subject do
        described_class.generate(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns an instance of CumulativeSum' do
          is_expected.to be_instance_of(CumulativeSum)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns an instance of CumulativeSum' do
          is_expected.to be_instance_of(CumulativeSum)
        end
      end
    end

    context 'when .generate is executed with block' do
      let :mod do
        3
      end

      subject do
        described_class.generate(array) do |last, i|
          (last + i) % mod
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns an instance of CumulativeSum' do
          is_expected.to be_instance_of(CumulativeSum)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns an instance of CumulativeSum' do
          is_expected.to be_instance_of(CumulativeSum)
        end
      end
    end
  end

  describe '#result' do
    let :instance do
      raise NotImplementError
    end

    subject do
      instance.result
    end

    context 'when .generate is executed without block' do
      let :instance do
        described_class.generate(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative sum.' do
          is_expected.to eq([0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative sum.' do
          is_expected.to eq([0, 1, 2, 4, 7, 12, 20, 33, 54, 88, 143])
        end
      end
    end

    context 'when .generate is executed with block' do
      let :mod do
        3
      end

      let :instance do
        described_class.generate(array) do |last, i|
          (last + i) % mod
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative sum calculated by logic in given block.' do
          is_expected.to eq([0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative sum calculated by logic in given block.' do
          is_expected.to eq([0, 1, 2, 1, 1, 0, 2, 0, 0, 1, 2])
        end
      end
    end
  end

  describe '#between' do
    context 'when .generate is executed without block' do
      let :instance do
        CumulativeSum.generate(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns a value of cumulative sum between given indexes.' do
          expect(instance.between(0, 0)).to eq(1)
          expect(instance.between(0, 1)).to eq(3)
          expect(instance.between(0, 2)).to eq(6)
          expect(instance.between(0, 3)).to eq(10)
          expect(instance.between(0, 4)).to eq(15)
          expect(instance.between(0, 5)).to eq(21)
          expect(instance.between(0, 6)).to eq(28)
          expect(instance.between(0, 7)).to eq(36)
          expect(instance.between(0, 8)).to eq(45)
          expect(instance.between(0, 9)).to eq(55)

          expect { instance.between(1, 0) }.to raise_error(ArgumentError)
          expect(instance.between(1, 1)).to eq(2)
          expect(instance.between(1, 2)).to eq(5)
          expect(instance.between(1, 3)).to eq(9)
          expect(instance.between(1, 4)).to eq(14)
          expect(instance.between(1, 5)).to eq(20)
          expect(instance.between(1, 6)).to eq(27)
          expect(instance.between(1, 7)).to eq(35)
          expect(instance.between(1, 8)).to eq(44)
          expect(instance.between(1, 9)).to eq(54)

          expect { instance.between(2, 0) }.to raise_error(ArgumentError)
          expect { instance.between(2, 1) }.to raise_error(ArgumentError)
          expect(instance.between(2, 2)).to eq(3)
          expect(instance.between(2, 3)).to eq(7)
          expect(instance.between(2, 4)).to eq(12)
          expect(instance.between(2, 5)).to eq(18)
          expect(instance.between(2, 6)).to eq(25)
          expect(instance.between(2, 7)).to eq(33)
          expect(instance.between(2, 8)).to eq(42)
          expect(instance.between(2, 9)).to eq(52)

          expect { instance.between(3, 0) }.to raise_error(ArgumentError)
          expect { instance.between(3, 1) }.to raise_error(ArgumentError)
          expect { instance.between(3, 2) }.to raise_error(ArgumentError)
          expect(instance.between(3, 3)).to eq(4)
          expect(instance.between(3, 4)).to eq(9)
          expect(instance.between(3, 5)).to eq(15)
          expect(instance.between(3, 6)).to eq(22)
          expect(instance.between(3, 7)).to eq(30)
          expect(instance.between(3, 8)).to eq(39)
          expect(instance.between(3, 9)).to eq(49)

          expect { instance.between(4, 0) }.to raise_error(ArgumentError)
          expect { instance.between(4, 1) }.to raise_error(ArgumentError)
          expect { instance.between(4, 2) }.to raise_error(ArgumentError)
          expect { instance.between(4, 3) }.to raise_error(ArgumentError)
          expect(instance.between(4, 4)).to eq(5)
          expect(instance.between(4, 5)).to eq(11)
          expect(instance.between(4, 6)).to eq(18)
          expect(instance.between(4, 7)).to eq(26)
          expect(instance.between(4, 8)).to eq(35)
          expect(instance.between(4, 9)).to eq(45)

          expect { instance.between(5, 0) }.to raise_error(ArgumentError)
          expect { instance.between(5, 1) }.to raise_error(ArgumentError)
          expect { instance.between(5, 2) }.to raise_error(ArgumentError)
          expect { instance.between(5, 3) }.to raise_error(ArgumentError)
          expect { instance.between(5, 4) }.to raise_error(ArgumentError)
          expect(instance.between(5, 5)).to eq(6)
          expect(instance.between(5, 6)).to eq(13)
          expect(instance.between(5, 7)).to eq(21)
          expect(instance.between(5, 8)).to eq(30)
          expect(instance.between(5, 9)).to eq(40)

          expect { instance.between(6, 0) }.to raise_error(ArgumentError)
          expect { instance.between(6, 1) }.to raise_error(ArgumentError)
          expect { instance.between(6, 2) }.to raise_error(ArgumentError)
          expect { instance.between(6, 3) }.to raise_error(ArgumentError)
          expect { instance.between(6, 4) }.to raise_error(ArgumentError)
          expect { instance.between(6, 5) }.to raise_error(ArgumentError)
          expect(instance.between(6, 6)).to eq(7)
          expect(instance.between(6, 7)).to eq(15)
          expect(instance.between(6, 8)).to eq(24)
          expect(instance.between(6, 9)).to eq(34)

          expect { instance.between(7, 0) }.to raise_error(ArgumentError)
          expect { instance.between(7, 1) }.to raise_error(ArgumentError)
          expect { instance.between(7, 2) }.to raise_error(ArgumentError)
          expect { instance.between(7, 3) }.to raise_error(ArgumentError)
          expect { instance.between(7, 4) }.to raise_error(ArgumentError)
          expect { instance.between(7, 5) }.to raise_error(ArgumentError)
          expect { instance.between(7, 6) }.to raise_error(ArgumentError)
          expect(instance.between(7, 7)).to eq(8)
          expect(instance.between(7, 8)).to eq(17)
          expect(instance.between(7, 9)).to eq(27)

          expect { instance.between(8, 0) }.to raise_error(ArgumentError)
          expect { instance.between(8, 1) }.to raise_error(ArgumentError)
          expect { instance.between(8, 2) }.to raise_error(ArgumentError)
          expect { instance.between(8, 3) }.to raise_error(ArgumentError)
          expect { instance.between(8, 4) }.to raise_error(ArgumentError)
          expect { instance.between(8, 5) }.to raise_error(ArgumentError)
          expect { instance.between(8, 6) }.to raise_error(ArgumentError)
          expect { instance.between(8, 7) }.to raise_error(ArgumentError)
          expect(instance.between(8, 8)).to eq(9)
          expect(instance.between(8, 9)).to eq(19)

          expect { instance.between(9, 0) }.to raise_error(ArgumentError)
          expect { instance.between(9, 1) }.to raise_error(ArgumentError)
          expect { instance.between(9, 2) }.to raise_error(ArgumentError)
          expect { instance.between(9, 3) }.to raise_error(ArgumentError)
          expect { instance.between(9, 4) }.to raise_error(ArgumentError)
          expect { instance.between(9, 5) }.to raise_error(ArgumentError)
          expect { instance.between(9, 6) }.to raise_error(ArgumentError)
          expect { instance.between(9, 7) }.to raise_error(ArgumentError)
          expect { instance.between(9, 8) }.to raise_error(ArgumentError)
          expect(instance.between(9, 9)).to eq(10)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns a value of cumulative sum between given indexes.' do
          expect(instance.between(0, 0)).to eq(1)
          expect(instance.between(0, 1)).to eq(2)
          expect(instance.between(0, 2)).to eq(4)
          expect(instance.between(0, 3)).to eq(7)
          expect(instance.between(0, 4)).to eq(12)
          expect(instance.between(0, 5)).to eq(20)
          expect(instance.between(0, 6)).to eq(33)
          expect(instance.between(0, 7)).to eq(54)
          expect(instance.between(0, 8)).to eq(88)
          expect(instance.between(0, 9)).to eq(143)

          expect { instance.between(1, 0) }.to raise_error(ArgumentError)
          expect(instance.between(1, 1)).to eq(1)
          expect(instance.between(1, 2)).to eq(3)
          expect(instance.between(1, 3)).to eq(6)
          expect(instance.between(1, 4)).to eq(11)
          expect(instance.between(1, 5)).to eq(19)
          expect(instance.between(1, 6)).to eq(32)
          expect(instance.between(1, 7)).to eq(53)
          expect(instance.between(1, 8)).to eq(87)
          expect(instance.between(1, 9)).to eq(142)

          expect { instance.between(2, 0) }.to raise_error(ArgumentError)
          expect { instance.between(2, 1) }.to raise_error(ArgumentError)
          expect(instance.between(2, 2)).to eq(2)
          expect(instance.between(2, 3)).to eq(5)
          expect(instance.between(2, 4)).to eq(10)
          expect(instance.between(2, 5)).to eq(18)
          expect(instance.between(2, 6)).to eq(31)
          expect(instance.between(2, 7)).to eq(52)
          expect(instance.between(2, 8)).to eq(86)
          expect(instance.between(2, 9)).to eq(141)

          expect { instance.between(3, 0) }.to raise_error(ArgumentError)
          expect { instance.between(3, 1) }.to raise_error(ArgumentError)
          expect { instance.between(3, 2) }.to raise_error(ArgumentError)
          expect(instance.between(3, 3)).to eq(3)
          expect(instance.between(3, 4)).to eq(8)
          expect(instance.between(3, 5)).to eq(16)
          expect(instance.between(3, 6)).to eq(29)
          expect(instance.between(3, 7)).to eq(50)
          expect(instance.between(3, 8)).to eq(84)
          expect(instance.between(3, 9)).to eq(139)

          expect { instance.between(4, 0) }.to raise_error(ArgumentError)
          expect { instance.between(4, 1) }.to raise_error(ArgumentError)
          expect { instance.between(4, 2) }.to raise_error(ArgumentError)
          expect { instance.between(4, 3) }.to raise_error(ArgumentError)
          expect(instance.between(4, 4)).to eq(5)
          expect(instance.between(4, 5)).to eq(13)
          expect(instance.between(4, 6)).to eq(26)
          expect(instance.between(4, 7)).to eq(47)
          expect(instance.between(4, 8)).to eq(81)
          expect(instance.between(4, 9)).to eq(136)

          expect { instance.between(5, 0) }.to raise_error(ArgumentError)
          expect { instance.between(5, 1) }.to raise_error(ArgumentError)
          expect { instance.between(5, 2) }.to raise_error(ArgumentError)
          expect { instance.between(5, 3) }.to raise_error(ArgumentError)
          expect { instance.between(5, 4) }.to raise_error(ArgumentError)
          expect(instance.between(5, 5)).to eq(8)
          expect(instance.between(5, 6)).to eq(21)
          expect(instance.between(5, 7)).to eq(42)
          expect(instance.between(5, 8)).to eq(76)
          expect(instance.between(5, 9)).to eq(131)

          expect { instance.between(6, 0) }.to raise_error(ArgumentError)
          expect { instance.between(6, 1) }.to raise_error(ArgumentError)
          expect { instance.between(6, 2) }.to raise_error(ArgumentError)
          expect { instance.between(6, 3) }.to raise_error(ArgumentError)
          expect { instance.between(6, 4) }.to raise_error(ArgumentError)
          expect { instance.between(6, 5) }.to raise_error(ArgumentError)
          expect(instance.between(6, 6)).to eq(13)
          expect(instance.between(6, 7)).to eq(34)
          expect(instance.between(6, 8)).to eq(68)
          expect(instance.between(6, 9)).to eq(123)

          expect { instance.between(7, 0) }.to raise_error(ArgumentError)
          expect { instance.between(7, 1) }.to raise_error(ArgumentError)
          expect { instance.between(7, 2) }.to raise_error(ArgumentError)
          expect { instance.between(7, 3) }.to raise_error(ArgumentError)
          expect { instance.between(7, 4) }.to raise_error(ArgumentError)
          expect { instance.between(7, 5) }.to raise_error(ArgumentError)
          expect { instance.between(7, 6) }.to raise_error(ArgumentError)
          expect(instance.between(7, 7)).to eq(21)
          expect(instance.between(7, 8)).to eq(55)
          expect(instance.between(7, 9)).to eq(110)

          expect { instance.between(8, 0) }.to raise_error(ArgumentError)
          expect { instance.between(8, 1) }.to raise_error(ArgumentError)
          expect { instance.between(8, 2) }.to raise_error(ArgumentError)
          expect { instance.between(8, 3) }.to raise_error(ArgumentError)
          expect { instance.between(8, 4) }.to raise_error(ArgumentError)
          expect { instance.between(8, 5) }.to raise_error(ArgumentError)
          expect { instance.between(8, 6) }.to raise_error(ArgumentError)
          expect { instance.between(8, 7) }.to raise_error(ArgumentError)
          expect(instance.between(8, 8)).to eq(34)
          expect(instance.between(8, 9)).to eq(89)

          expect { instance.between(9, 0) }.to raise_error(ArgumentError)
          expect { instance.between(9, 1) }.to raise_error(ArgumentError)
          expect { instance.between(9, 2) }.to raise_error(ArgumentError)
          expect { instance.between(9, 3) }.to raise_error(ArgumentError)
          expect { instance.between(9, 4) }.to raise_error(ArgumentError)
          expect { instance.between(9, 5) }.to raise_error(ArgumentError)
          expect { instance.between(9, 6) }.to raise_error(ArgumentError)
          expect { instance.between(9, 7) }.to raise_error(ArgumentError)
          expect { instance.between(9, 8) }.to raise_error(ArgumentError)
          expect(instance.between(9, 9)).to eq(55)
        end
      end
    end

    context 'when .generate is executed with block' do
      let :mod do
        3
      end

      let :instance do
        CumulativeSum.generate(array) do |last, i|
          (last + i) % mod
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns a value of cumulative sum between given indexes.' do
          expect(instance.between(0, 0) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(0, 1) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 2) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 3) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(0, 4) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 5) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 6) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(0, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(1, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(1, 1) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 2) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 3) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(1, 4) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 5) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 6) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(1, 7) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 8) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 9) { |a, b| (b - a) % mod }).to eq(0)

          expect { instance.between(2, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(2, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(2, 2) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(2, 3) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(2, 4) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(2, 5) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(2, 6) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(2, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(2, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(2, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(3, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(3, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(3, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(3, 3) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(3, 4) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(3, 5) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(3, 6) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(3, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(3, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(3, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(4, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(4, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(4, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(4, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(4, 4) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(4, 5) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(4, 6) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(4, 7) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(4, 8) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(4, 9) { |a, b| (b - a) % mod }).to eq(0)

          expect { instance.between(5, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(5, 5) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(5, 6) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(5, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(5, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(5, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(6, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(6, 6) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(6, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(6, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(6, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(7, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 6) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(7, 7) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(7, 8) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(7, 9) { |a, b| (b - a) % mod }).to eq(0)

          expect { instance.between(8, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 6) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 7) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(8, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(8, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(9, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 6) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 7) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 8) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(9, 9) { |a, b| (b - a) % mod }).to eq(1)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns a value of cumulative sum between given indexes.' do
          expect(instance.between(0, 0) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(0, 1) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(0, 2) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(0, 3) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(0, 4) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 5) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(0, 6) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(0, 8) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(0, 9) { |a, b| (b - a) % mod }).to eq(2)

          expect { instance.between(1, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(1, 1) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(1, 2) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(1, 3) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(1, 4) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 5) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(1, 6) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 7) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(1, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(1, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(2, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(2, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(2, 2) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(2, 3) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(2, 4) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(2, 5) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(2, 6) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(2, 7) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(2, 8) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(2, 9) { |a, b| (b - a) % mod }).to eq(0)

          expect { instance.between(3, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(3, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(3, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(3, 3) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(3, 4) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(3, 5) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(3, 6) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(3, 7) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(3, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(3, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(4, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(4, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(4, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(4, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(4, 4) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(4, 5) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(4, 6) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(4, 7) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(4, 8) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(4, 9) { |a, b| (b - a) % mod }).to eq(1)

          expect { instance.between(5, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(5, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(5, 5) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(5, 6) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(5, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(5, 8) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(5, 9) { |a, b| (b - a) % mod }).to eq(2)

          expect { instance.between(6, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(6, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(6, 6) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(6, 7) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(6, 8) { |a, b| (b - a) % mod }).to eq(2)
          expect(instance.between(6, 9) { |a, b| (b - a) % mod }).to eq(0)

          expect { instance.between(7, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(7, 6) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(7, 7) { |a, b| (b - a) % mod }).to eq(0)
          expect(instance.between(7, 8) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(7, 9) { |a, b| (b - a) % mod }).to eq(2)

          expect { instance.between(8, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 6) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(8, 7) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(8, 8) { |a, b| (b - a) % mod }).to eq(1)
          expect(instance.between(8, 9) { |a, b| (b - a) % mod }).to eq(2)

          expect { instance.between(9, 0) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 1) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 2) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 3) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 4) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 5) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 6) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 7) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect { instance.between(9, 8) { |a, b| (b - a) % mod } }.to raise_error(ArgumentError)
          expect(instance.between(9, 9) { |a, b| (b - a) % mod }).to eq(1)
        end
      end
    end
  end
end

describe CumulativeProduct do
  describe '.generate (class method)' do
    context 'when .generate is executed without block' do
      subject do
        described_class.generate(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns an instance of CumulativeProduct.' do
          is_expected.to be_instance_of(CumulativeProduct)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns an instance of CumulativeProduct.' do
          is_expected.to be_instance_of(CumulativeProduct)
        end
      end
    end

    context 'when .generate is executed with block' do
      let :mod do
        10_007
      end

      subject do
        described_class.generate(array) do |last, i|
          (last * i) % mod
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns an instance of CumulativeProduct.' do
          is_expected.to be_instance_of(CumulativeProduct)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns an instance of CumulativeProduct.' do
          is_expected.to be_instance_of(CumulativeProduct)
        end
      end
    end
  end

  describe '#result' do
    let :instance do
      raise NotImplementError
    end

    subject do
      instance.result
    end

    context 'when .generate is executed without block' do
      let :instance do
        described_class.generate(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative product.' do
          is_expected.to eq([1, 1, 2, 6, 24, 120, 720, 5_040, 40_320, 362_880, 3_628_800])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative product.' do
          is_expected.to eq([1, 1, 1, 2, 6, 30, 240, 3_120, 65_520, 2_227_680, 122_522_400])
        end
      end
    end

    context 'when .generate is executed with block' do
      let :mod do
        10_007
      end

      let :instance do
        described_class.generate(array) do |last, i|
          (last * i) % mod
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns array of cumulative product calculated by logic in given block.' do
          is_expected.to eq([1, 1, 2, 6, 24, 120, 720, 5_040, 292, 2628, 6266])
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns array of cumulative product calculated by logic in given block.' do
          is_expected.to eq([1, 1, 1, 2, 6, 30, 240, 3_120, 5478, 6126, 6699])
        end
      end
    end
  end

  describe '#between' do
    context 'when .generate is executed without block' do
      let :instance do
        CumulativeProduct.generate(array)
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns a value of cumulative product between given indexes.' do
          expect(instance.between(0, 0)).to eq(1)
          expect(instance.between(0, 1)).to eq(2)
          expect(instance.between(0, 2)).to eq(6)
          expect(instance.between(0, 3)).to eq(24)
          expect(instance.between(0, 4)).to eq(120)
          expect(instance.between(0, 5)).to eq(720)
          expect(instance.between(0, 6)).to eq(5_040)
          expect(instance.between(0, 7)).to eq(40_320)
          expect(instance.between(0, 8)).to eq(362_880)
          expect(instance.between(0, 9)).to eq(3_628_800)

          expect { instance.between(1, 0) }.to raise_error(ArgumentError)
          expect(instance.between(1, 1)).to eq(2)
          expect(instance.between(1, 2)).to eq(6)
          expect(instance.between(1, 3)).to eq(24)
          expect(instance.between(1, 4)).to eq(120)
          expect(instance.between(1, 5)).to eq(720)
          expect(instance.between(1, 6)).to eq(5_040)
          expect(instance.between(1, 7)).to eq(40_320)
          expect(instance.between(1, 8)).to eq(362_880)
          expect(instance.between(1, 9)).to eq(3_628_800)

          expect { instance.between(2, 0) }.to raise_error(ArgumentError)
          expect { instance.between(2, 1) }.to raise_error(ArgumentError)
          expect(instance.between(2, 2)).to eq(3)
          expect(instance.between(2, 3)).to eq(12)
          expect(instance.between(2, 4)).to eq(60)
          expect(instance.between(2, 5)).to eq(360)
          expect(instance.between(2, 6)).to eq(2_520)
          expect(instance.between(2, 7)).to eq(20_160)
          expect(instance.between(2, 8)).to eq(181_440)
          expect(instance.between(2, 9)).to eq(1_814_400)

          expect { instance.between(3, 0) }.to raise_error(ArgumentError)
          expect { instance.between(3, 1) }.to raise_error(ArgumentError)
          expect { instance.between(3, 2) }.to raise_error(ArgumentError)
          expect(instance.between(3, 3)).to eq(4)
          expect(instance.between(3, 4)).to eq(20)
          expect(instance.between(3, 5)).to eq(120)
          expect(instance.between(3, 6)).to eq(840)
          expect(instance.between(3, 7)).to eq(6_720)
          expect(instance.between(3, 8)).to eq(60_480)
          expect(instance.between(3, 9)).to eq(604_800)

          expect { instance.between(4, 0) }.to raise_error(ArgumentError)
          expect { instance.between(4, 1) }.to raise_error(ArgumentError)
          expect { instance.between(4, 2) }.to raise_error(ArgumentError)
          expect { instance.between(4, 3) }.to raise_error(ArgumentError)
          expect(instance.between(4, 4)).to eq(5)
          expect(instance.between(4, 5)).to eq(30)
          expect(instance.between(4, 6)).to eq(210)
          expect(instance.between(4, 7)).to eq(1_680)
          expect(instance.between(4, 8)).to eq(15_120)
          expect(instance.between(4, 9)).to eq(151_200)

          expect { instance.between(5, 0) }.to raise_error(ArgumentError)
          expect { instance.between(5, 1) }.to raise_error(ArgumentError)
          expect { instance.between(5, 2) }.to raise_error(ArgumentError)
          expect { instance.between(5, 3) }.to raise_error(ArgumentError)
          expect { instance.between(5, 4) }.to raise_error(ArgumentError)
          expect(instance.between(5, 5)).to eq(6)
          expect(instance.between(5, 6)).to eq(42)
          expect(instance.between(5, 7)).to eq(336)
          expect(instance.between(5, 8)).to eq(3_024)
          expect(instance.between(5, 9)).to eq(30_240)

          expect { instance.between(6, 0) }.to raise_error(ArgumentError)
          expect { instance.between(6, 1) }.to raise_error(ArgumentError)
          expect { instance.between(6, 2) }.to raise_error(ArgumentError)
          expect { instance.between(6, 3) }.to raise_error(ArgumentError)
          expect { instance.between(6, 4) }.to raise_error(ArgumentError)
          expect { instance.between(6, 5) }.to raise_error(ArgumentError)
          expect(instance.between(6, 6)).to eq(7)
          expect(instance.between(6, 7)).to eq(56)
          expect(instance.between(6, 8)).to eq(504)
          expect(instance.between(6, 9)).to eq(5_040)

          expect { instance.between(7, 0) }.to raise_error(ArgumentError)
          expect { instance.between(7, 1) }.to raise_error(ArgumentError)
          expect { instance.between(7, 2) }.to raise_error(ArgumentError)
          expect { instance.between(7, 3) }.to raise_error(ArgumentError)
          expect { instance.between(7, 4) }.to raise_error(ArgumentError)
          expect { instance.between(7, 5) }.to raise_error(ArgumentError)
          expect { instance.between(7, 6) }.to raise_error(ArgumentError)
          expect(instance.between(7, 7)).to eq(8)
          expect(instance.between(7, 8)).to eq(72)
          expect(instance.between(7, 9)).to eq(720)

          expect { instance.between(8, 0) }.to raise_error(ArgumentError)
          expect { instance.between(8, 1) }.to raise_error(ArgumentError)
          expect { instance.between(8, 2) }.to raise_error(ArgumentError)
          expect { instance.between(8, 3) }.to raise_error(ArgumentError)
          expect { instance.between(8, 4) }.to raise_error(ArgumentError)
          expect { instance.between(8, 5) }.to raise_error(ArgumentError)
          expect { instance.between(8, 6) }.to raise_error(ArgumentError)
          expect { instance.between(8, 7) }.to raise_error(ArgumentError)
          expect(instance.between(8, 8)).to eq(9)
          expect(instance.between(8, 9)).to eq(90)

          expect { instance.between(9, 0) }.to raise_error(ArgumentError)
          expect { instance.between(9, 1) }.to raise_error(ArgumentError)
          expect { instance.between(9, 2) }.to raise_error(ArgumentError)
          expect { instance.between(9, 3) }.to raise_error(ArgumentError)
          expect { instance.between(9, 4) }.to raise_error(ArgumentError)
          expect { instance.between(9, 5) }.to raise_error(ArgumentError)
          expect { instance.between(9, 6) }.to raise_error(ArgumentError)
          expect { instance.between(9, 7) }.to raise_error(ArgumentError)
          expect { instance.between(9, 8) }.to raise_error(ArgumentError)
          expect(instance.between(9, 9)).to eq(10)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns a value of cumulative product between given indexes.' do
          expect(instance.between(0, 0)).to eq(1)
          expect(instance.between(0, 1)).to eq(1)
          expect(instance.between(0, 2)).to eq(2)
          expect(instance.between(0, 3)).to eq(6)
          expect(instance.between(0, 4)).to eq(30)
          expect(instance.between(0, 5)).to eq(240)
          expect(instance.between(0, 6)).to eq(3_120)
          expect(instance.between(0, 7)).to eq(65_520)
          expect(instance.between(0, 8)).to eq(2_227_680)
          expect(instance.between(0, 9)).to eq(122_522_400)

          expect { instance.between(1, 0) }.to raise_error(ArgumentError)
          expect(instance.between(1, 1)).to eq(1)
          expect(instance.between(1, 2)).to eq(2)
          expect(instance.between(1, 3)).to eq(6)
          expect(instance.between(1, 4)).to eq(30)
          expect(instance.between(1, 5)).to eq(240)
          expect(instance.between(1, 6)).to eq(3_120)
          expect(instance.between(1, 7)).to eq(65_520)
          expect(instance.between(1, 8)).to eq(2_227_680)
          expect(instance.between(1, 9)).to eq(122_522_400)

          expect { instance.between(2, 0) }.to raise_error(ArgumentError)
          expect { instance.between(2, 1) }.to raise_error(ArgumentError)
          expect(instance.between(2, 2)).to eq(2)
          expect(instance.between(2, 3)).to eq(6)
          expect(instance.between(2, 4)).to eq(30)
          expect(instance.between(2, 5)).to eq(240)
          expect(instance.between(2, 6)).to eq(3_120)
          expect(instance.between(2, 7)).to eq(65_520)
          expect(instance.between(2, 8)).to eq(2_227_680)
          expect(instance.between(2, 9)).to eq(122_522_400)

          expect { instance.between(3, 0) }.to raise_error(ArgumentError)
          expect { instance.between(3, 1) }.to raise_error(ArgumentError)
          expect { instance.between(3, 2) }.to raise_error(ArgumentError)
          expect(instance.between(3, 3)).to eq(3)
          expect(instance.between(3, 4)).to eq(15)
          expect(instance.between(3, 5)).to eq(120)
          expect(instance.between(3, 6)).to eq(1_560)
          expect(instance.between(3, 7)).to eq(32_760)
          expect(instance.between(3, 8)).to eq(1_113_840)
          expect(instance.between(3, 9)).to eq(61_261_200)

          expect { instance.between(4, 0) }.to raise_error(ArgumentError)
          expect { instance.between(4, 1) }.to raise_error(ArgumentError)
          expect { instance.between(4, 2) }.to raise_error(ArgumentError)
          expect { instance.between(4, 3) }.to raise_error(ArgumentError)
          expect(instance.between(4, 4)).to eq(5)
          expect(instance.between(4, 5)).to eq(40)
          expect(instance.between(4, 6)).to eq(520)
          expect(instance.between(4, 7)).to eq(10_920)
          expect(instance.between(4, 8)).to eq(371_280)
          expect(instance.between(4, 9)).to eq(20_420_400)

          expect { instance.between(5, 0) }.to raise_error(ArgumentError)
          expect { instance.between(5, 1) }.to raise_error(ArgumentError)
          expect { instance.between(5, 2) }.to raise_error(ArgumentError)
          expect { instance.between(5, 3) }.to raise_error(ArgumentError)
          expect { instance.between(5, 4) }.to raise_error(ArgumentError)
          expect(instance.between(5, 5)).to eq(8)
          expect(instance.between(5, 6)).to eq(104)
          expect(instance.between(5, 7)).to eq(2_184)
          expect(instance.between(5, 8)).to eq(74_256)
          expect(instance.between(5, 9)).to eq(4_084_080)

          expect { instance.between(6, 0) }.to raise_error(ArgumentError)
          expect { instance.between(6, 1) }.to raise_error(ArgumentError)
          expect { instance.between(6, 2) }.to raise_error(ArgumentError)
          expect { instance.between(6, 3) }.to raise_error(ArgumentError)
          expect { instance.between(6, 4) }.to raise_error(ArgumentError)
          expect { instance.between(6, 5) }.to raise_error(ArgumentError)
          expect(instance.between(6, 6)).to eq(13)
          expect(instance.between(6, 7)).to eq(273)
          expect(instance.between(6, 8)).to eq(9_282)
          expect(instance.between(6, 9)).to eq(510_510)

          expect { instance.between(7, 0) }.to raise_error(ArgumentError)
          expect { instance.between(7, 1) }.to raise_error(ArgumentError)
          expect { instance.between(7, 2) }.to raise_error(ArgumentError)
          expect { instance.between(7, 3) }.to raise_error(ArgumentError)
          expect { instance.between(7, 4) }.to raise_error(ArgumentError)
          expect { instance.between(7, 5) }.to raise_error(ArgumentError)
          expect { instance.between(7, 6) }.to raise_error(ArgumentError)
          expect(instance.between(7, 7)).to eq(21)
          expect(instance.between(7, 8)).to eq(714)
          expect(instance.between(7, 9)).to eq(39_270)

          expect { instance.between(8, 0) }.to raise_error(ArgumentError)
          expect { instance.between(8, 1) }.to raise_error(ArgumentError)
          expect { instance.between(8, 2) }.to raise_error(ArgumentError)
          expect { instance.between(8, 3) }.to raise_error(ArgumentError)
          expect { instance.between(8, 4) }.to raise_error(ArgumentError)
          expect { instance.between(8, 5) }.to raise_error(ArgumentError)
          expect { instance.between(8, 6) }.to raise_error(ArgumentError)
          expect { instance.between(8, 7) }.to raise_error(ArgumentError)
          expect(instance.between(8, 8)).to eq(34)
          expect(instance.between(8, 9)).to eq(1_870)

          expect { instance.between(9, 0) }.to raise_error(ArgumentError)
          expect { instance.between(9, 1) }.to raise_error(ArgumentError)
          expect { instance.between(9, 2) }.to raise_error(ArgumentError)
          expect { instance.between(9, 3) }.to raise_error(ArgumentError)
          expect { instance.between(9, 4) }.to raise_error(ArgumentError)
          expect { instance.between(9, 5) }.to raise_error(ArgumentError)
          expect { instance.between(9, 6) }.to raise_error(ArgumentError)
          expect { instance.between(9, 7) }.to raise_error(ArgumentError)
          expect { instance.between(9, 8) }.to raise_error(ArgumentError)
          expect(instance.between(9, 9)).to eq(55)
        end
      end
    end

    context 'when .generate is executed with block' do
      let :mod do
        10_007
      end

      let :inverse_instance do
        Inverse.generate(mod - 1, mod)
      end

      let :instance do
        CumulativeProduct.generate(array) do |last, i|
          (last * i) % mod
        end
      end

      context 'arithmetic sequence' do
        let :array do
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        end

        it 'returns a value of cumulative product between given indexes.' do
          expect(instance_between(instance, 0, 0, inverse_instance, mod)).to eq(1)
          expect(instance_between(instance, 0, 1, inverse_instance, mod)).to eq(2)
          expect(instance_between(instance, 0, 2, inverse_instance, mod)).to eq(6)
          expect(instance_between(instance, 0, 3, inverse_instance, mod)).to eq(24)
          expect(instance_between(instance, 0, 4, inverse_instance, mod)).to eq(120)
          expect(instance_between(instance, 0, 5, inverse_instance, mod)).to eq(720)
          expect(instance_between(instance, 0, 6, inverse_instance, mod)).to eq(5_040)
          expect(instance_between(instance, 0, 7, inverse_instance, mod)).to eq(292)
          expect(instance_between(instance, 0, 8, inverse_instance, mod)).to eq(2_628)
          expect(instance_between(instance, 0, 9, inverse_instance, mod)).to eq(6_266)

          expect { instance_between(1, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 1, 1, inverse_instance, mod)).to eq(2)
          expect(instance_between(instance, 1, 2, inverse_instance, mod)).to eq(6)
          expect(instance_between(instance, 1, 3, inverse_instance, mod)).to eq(24)
          expect(instance_between(instance, 1, 4, inverse_instance, mod)).to eq(120)
          expect(instance_between(instance, 1, 5, inverse_instance, mod)).to eq(720)
          expect(instance_between(instance, 1, 6, inverse_instance, mod)).to eq(5_040)
          expect(instance_between(instance, 1, 7, inverse_instance, mod)).to eq(292)
          expect(instance_between(instance, 1, 8, inverse_instance, mod)).to eq(2_628)
          expect(instance_between(instance, 1, 9, inverse_instance, mod)).to eq(6_266)

          expect { instance_between(2, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(2, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 2, 2, inverse_instance, mod)).to eq(3)
          expect(instance_between(instance, 2, 3, inverse_instance, mod)).to eq(12)
          expect(instance_between(instance, 2, 4, inverse_instance, mod)).to eq(60)
          expect(instance_between(instance, 2, 5, inverse_instance, mod)).to eq(360)
          expect(instance_between(instance, 2, 6, inverse_instance, mod)).to eq(2_520)
          expect(instance_between(instance, 2, 7, inverse_instance, mod)).to eq(146)
          expect(instance_between(instance, 2, 8, inverse_instance, mod)).to eq(1_314)
          expect(instance_between(instance, 2, 9, inverse_instance, mod)).to eq(3_133)

          expect { instance_between(3, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(3, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(3, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 3, 3, inverse_instance, mod)).to eq(4)
          expect(instance_between(instance, 3, 4, inverse_instance, mod)).to eq(20)
          expect(instance_between(instance, 3, 5, inverse_instance, mod)).to eq(120)
          expect(instance_between(instance, 3, 6, inverse_instance, mod)).to eq(840)
          expect(instance_between(instance, 3, 7, inverse_instance, mod)).to eq(6_720)
          expect(instance_between(instance, 3, 8, inverse_instance, mod)).to eq(438)
          expect(instance_between(instance, 3, 9, inverse_instance, mod)).to eq(4_380)

          expect { instance_between(4, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(4, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(4, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(4, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 4, 4, inverse_instance, mod)).to eq(5)
          expect(instance_between(instance, 4, 5, inverse_instance, mod)).to eq(30)
          expect(instance_between(instance, 4, 6, inverse_instance, mod)).to eq(210)
          expect(instance_between(instance, 4, 7, inverse_instance, mod)).to eq(1_680)
          expect(instance_between(instance, 4, 8, inverse_instance, mod)).to eq(5_113)
          expect(instance_between(instance, 4, 9, inverse_instance, mod)).to eq(1_095)

          expect { instance_between(5, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 5, 5, inverse_instance, mod)).to eq(6)
          expect(instance_between(instance, 5, 6, inverse_instance, mod)).to eq(42)
          expect(instance_between(instance, 5, 7, inverse_instance, mod)).to eq(336)
          expect(instance_between(instance, 5, 8, inverse_instance, mod)).to eq(3_024)
          expect(instance_between(instance, 5, 9, inverse_instance, mod)).to eq(219)

          expect { instance_between(6, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 6, 6, inverse_instance, mod)).to eq(7)
          expect(instance_between(instance, 6, 7, inverse_instance, mod)).to eq(56)
          expect(instance_between(instance, 6, 8, inverse_instance, mod)).to eq(504)
          expect(instance_between(instance, 6, 9, inverse_instance, mod)).to eq(5_040)

          expect { instance_between(7, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 6, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 7, 7, inverse_instance, mod)).to eq(8)
          expect(instance_between(instance, 7, 8, inverse_instance, mod)).to eq(72)
          expect(instance_between(instance, 7, 9, inverse_instance, mod)).to eq(720)

          expect { instance_between(8, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 6, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 7, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 8, 8, inverse_instance, mod)).to eq(9)
          expect(instance_between(instance, 8, 9, inverse_instance, mod)).to eq(90)

          expect { instance_between(9, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 6, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 7, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 8, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 9, 9, inverse_instance, mod)).to eq(10)
        end
      end

      context 'Fibonacci sequence' do
        let :array do
          [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        end

        it 'returns a value of cumulative product between given indexes.' do
          expect(instance_between(instance, 0, 0, inverse_instance, mod)).to eq(1)
          expect(instance_between(instance, 0, 1, inverse_instance, mod)).to eq(1)
          expect(instance_between(instance, 0, 2, inverse_instance, mod)).to eq(2)
          expect(instance_between(instance, 0, 3, inverse_instance, mod)).to eq(6)
          expect(instance_between(instance, 0, 4, inverse_instance, mod)).to eq(30)
          expect(instance_between(instance, 0, 5, inverse_instance, mod)).to eq(240)
          expect(instance_between(instance, 0, 6, inverse_instance, mod)).to eq(3_120)
          expect(instance_between(instance, 0, 7, inverse_instance, mod)).to eq(5_478)
          expect(instance_between(instance, 0, 8, inverse_instance, mod)).to eq(6_126)
          expect(instance_between(instance, 0, 9, inverse_instance, mod)).to eq(6_699)

          expect { instance_between(1, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 1, 1, inverse_instance, mod)).to eq(1)
          expect(instance_between(instance, 1, 2, inverse_instance, mod)).to eq(2)
          expect(instance_between(instance, 1, 3, inverse_instance, mod)).to eq(6)
          expect(instance_between(instance, 1, 4, inverse_instance, mod)).to eq(30)
          expect(instance_between(instance, 1, 5, inverse_instance, mod)).to eq(240)
          expect(instance_between(instance, 1, 6, inverse_instance, mod)).to eq(3_120)
          expect(instance_between(instance, 1, 7, inverse_instance, mod)).to eq(5_478)
          expect(instance_between(instance, 1, 8, inverse_instance, mod)).to eq(6_126)
          expect(instance_between(instance, 1, 9, inverse_instance, mod)).to eq(6_699)

          expect { instance_between(2, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(2, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 2, 2, inverse_instance, mod)).to eq(2)
          expect(instance_between(instance, 2, 3, inverse_instance, mod)).to eq(6)
          expect(instance_between(instance, 2, 4, inverse_instance, mod)).to eq(30)
          expect(instance_between(instance, 2, 5, inverse_instance, mod)).to eq(240)
          expect(instance_between(instance, 2, 6, inverse_instance, mod)).to eq(3_120)
          expect(instance_between(instance, 2, 7, inverse_instance, mod)).to eq(5_478)
          expect(instance_between(instance, 2, 8, inverse_instance, mod)).to eq(6_126)
          expect(instance_between(instance, 2, 9, inverse_instance, mod)).to eq(6_699)

          expect { instance_between(3, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(3, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(3, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 3, 3, inverse_instance, mod)).to eq(3)
          expect(instance_between(instance, 3, 4, inverse_instance, mod)).to eq(15)
          expect(instance_between(instance, 3, 5, inverse_instance, mod)).to eq(120)
          expect(instance_between(instance, 3, 6, inverse_instance, mod)).to eq(1_560)
          expect(instance_between(instance, 3, 7, inverse_instance, mod)).to eq(2_739)
          expect(instance_between(instance, 3, 8, inverse_instance, mod)).to eq(3_063)
          expect(instance_between(instance, 3, 9, inverse_instance, mod)).to eq(8_353)

          expect { instance_between(4, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(4, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(4, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(4, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 4, 4, inverse_instance, mod)).to eq(5)
          expect(instance_between(instance, 4, 5, inverse_instance, mod)).to eq(40)
          expect(instance_between(instance, 4, 6, inverse_instance, mod)).to eq(520)
          expect(instance_between(instance, 4, 7, inverse_instance, mod)).to eq(913)
          expect(instance_between(instance, 4, 8, inverse_instance, mod)).to eq(1_021)
          expect(instance_between(instance, 4, 9, inverse_instance, mod)).to eq(6_120)

          expect { instance_between(5, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(5, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 5, 5, inverse_instance, mod)).to eq(8)
          expect(instance_between(instance, 5, 6, inverse_instance, mod)).to eq(104)
          expect(instance_between(instance, 5, 7, inverse_instance, mod)).to eq(2_184)
          expect(instance_between(instance, 5, 8, inverse_instance, mod)).to eq(4_207)
          expect(instance_between(instance, 5, 9, inverse_instance, mod)).to eq(1_224)

          expect { instance_between(6, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(6, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 6, 6, inverse_instance, mod)).to eq(13)
          expect(instance_between(instance, 6, 7, inverse_instance, mod)).to eq(273)
          expect(instance_between(instance, 6, 8, inverse_instance, mod)).to eq(9_282)
          expect(instance_between(instance, 6, 9, inverse_instance, mod)).to eq(153)

          expect { instance_between(7, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(7, 6, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 7, 7, inverse_instance, mod)).to eq(21)
          expect(instance_between(instance, 7, 8, inverse_instance, mod)).to eq(714)
          expect(instance_between(instance, 7, 9, inverse_instance, mod)).to eq(9_249)

          expect { instance_between(8, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 6, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(8, 7, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 8, 8, inverse_instance, mod)).to eq(34)
          expect(instance_between(instance, 8, 9, inverse_instance, mod)).to eq(1_870)

          expect { instance_between(9, 0, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 1, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 2, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 3, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 4, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 5, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 6, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 7, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect { instance_between(9, 8, inverse_instance, mod) }.to raise_error(ArgumentError)
          expect(instance_between(instance, 9, 9, inverse_instance, mod)).to eq(55)
        end
      end
    end
  end
end
