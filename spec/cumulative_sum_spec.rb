# frozen_string_literal: true

require_relative './../lib/cumulative_sum'

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
