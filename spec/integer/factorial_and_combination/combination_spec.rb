require_relative './../../../lib/integer/factorial_and_combination'

describe Combination do
  let :mod do
    10**9 + 7
  end

  describe '.calc' do
    context 'n is less than 0' do
      context 'k is less than 0' do
        it 'returns 0' do
          expect(described_class.calc(  -1,   -1, mod)).to eq(0)

          expect(described_class.calc(  -2,   -1, mod)).to eq(0)
          expect(described_class.calc(-100,   -1, mod)).to eq(0)

          expect(described_class.calc(  -1,   -2, mod)).to eq(0)
          expect(described_class.calc(  -1, -100, mod)).to eq(0)
        end
      end

      context 'k is 0' do
        it 'returns 0' do
          expect(described_class.calc(  -1, 0, mod)).to eq(0)
          expect(described_class.calc(  -2, 0, mod)).to eq(0)

          expect(described_class.calc(-100, 0, mod)).to eq(0)
        end
      end

      context 'k is greater than 0' do
        it 'returns 0' do
          expect(described_class.calc(  -1,   1, mod)).to eq(0)
          expect(described_class.calc(  -2,   1, mod)).to eq(0)

          expect(described_class.calc(-100,   1, mod)).to eq(0)

          expect(described_class.calc(  -1, 100, mod)).to eq(0)
          expect(described_class.calc(  -2, 100, mod)).to eq(0)

          expect(described_class.calc(-100, 100, mod)).to eq(0)
        end
      end
    end

    context 'n is 0' do
      context 'k is less than 0' do
        it 'returns 0' do
          expect(described_class.calc(0,   -1, mod)).to eq(0)
          expect(described_class.calc(0, -100, mod)).to eq(0)
        end
      end

      context 'k is 0' do
        it 'returns 0' do
          expect(described_class.calc(0, 0, mod)).to eq(1)
        end
      end

      context 'k is greater than 0' do
        it 'returns 0' do
          expect(described_class.calc(0,   1, mod)).to eq(0)
          expect(described_class.calc(0, 100, mod)).to eq(0)
        end
      end
    end

    context 'n is greater than 0' do
      context 'k is less than 0' do
        it 'returns 0' do
          expect(described_class.calc(  1,   -1, mod)).to eq(0)
          expect(described_class.calc(  2,   -1, mod)).to eq(0)
          expect(described_class.calc(100,   -1, mod)).to eq(0)

          expect(described_class.calc(  1, -100, mod)).to eq(0)
          expect(described_class.calc(  2, -100, mod)).to eq(0)
          expect(described_class.calc(100, -100, mod)).to eq(0)
        end
      end

      context 'k is 0' do
        it 'returns 1' do
          expect(described_class.calc(  1, 0, mod)).to eq(1)
          expect(described_class.calc(  2, 0, mod)).to eq(1)
          expect(described_class.calc(  3, 0, mod)).to eq(1)
          expect(described_class.calc(  4, 0, mod)).to eq(1)
          expect(described_class.calc(  5, 0, mod)).to eq(1)
          expect(described_class.calc(  6, 0, mod)).to eq(1)
          expect(described_class.calc(  7, 0, mod)).to eq(1)
          expect(described_class.calc(  8, 0, mod)).to eq(1)
          expect(described_class.calc(  9, 0, mod)).to eq(1)
          expect(described_class.calc( 10, 0, mod)).to eq(1)

          expect(described_class.calc(100, 0, mod)).to eq(1)
        end
      end

      context 'k is greater than 0' do
        context 'k is 1' do
          it 'returns n' do
            expect(described_class.calc(  1, 1, mod)).to eq(  1)
            expect(described_class.calc(  2, 1, mod)).to eq(  2)
            expect(described_class.calc(  3, 1, mod)).to eq(  3)
            expect(described_class.calc(  4, 1, mod)).to eq(  4)
            expect(described_class.calc(  5, 1, mod)).to eq(  5)
            expect(described_class.calc(  6, 1, mod)).to eq(  6)
            expect(described_class.calc(  7, 1, mod)).to eq(  7)
            expect(described_class.calc(  8, 1, mod)).to eq(  8)
            expect(described_class.calc(  9, 1, mod)).to eq(  9)
            expect(described_class.calc( 10, 1, mod)).to eq( 10)

            expect(described_class.calc(100, 1, mod)).to eq(100)
          end
        end

        context 'k is greater than 1 and less than n - 1' do
          it 'returns number of combinations' do
            expect(described_class.calc(  4,  2, mod)).to eq(      6)

            expect(described_class.calc(  5,  2, mod)).to eq(     10)
            expect(described_class.calc(  5,  3, mod)).to eq(     10)

            expect(described_class.calc(  6,  2, mod)).to eq(     15)
            expect(described_class.calc(  6,  3, mod)).to eq(     20)
            expect(described_class.calc(  6,  4, mod)).to eq(     15)

            expect(described_class.calc(  7,  2, mod)).to eq(     21)
            expect(described_class.calc(  7,  3, mod)).to eq(     35)
            expect(described_class.calc(  7,  4, mod)).to eq(     35)
            expect(described_class.calc(  7,  5, mod)).to eq(     21)

            expect(described_class.calc(  8,  2, mod)).to eq(     28)
            expect(described_class.calc(  8,  3, mod)).to eq(     56)
            expect(described_class.calc(  8,  4, mod)).to eq(     70)
            expect(described_class.calc(  8,  5, mod)).to eq(     56)
            expect(described_class.calc(  8,  6, mod)).to eq(     28)

            expect(described_class.calc(  9,  2, mod)).to eq(     36)
            expect(described_class.calc(  9,  3, mod)).to eq(     84)
            expect(described_class.calc(  9,  4, mod)).to eq(    126)
            expect(described_class.calc(  9,  5, mod)).to eq(    126)
            expect(described_class.calc(  9,  6, mod)).to eq(     84)
            expect(described_class.calc(  9,  7, mod)).to eq(     36)

            expect(described_class.calc( 10,  2, mod)).to eq(     45)
            expect(described_class.calc( 10,  3, mod)).to eq(    120)
            expect(described_class.calc( 10,  4, mod)).to eq(    210)
            expect(described_class.calc( 10,  5, mod)).to eq(    252)
            expect(described_class.calc( 10,  6, mod)).to eq(    210)
            expect(described_class.calc( 10,  7, mod)).to eq(    120)
            expect(described_class.calc( 10,  8, mod)).to eq(     45)

            # --------

            expect(described_class.calc(100,  2, mod)).to eq(      4_950)
            expect(described_class.calc(100,  3, mod)).to eq(    161_700)
            expect(described_class.calc(100,  4, mod)).to eq(  3_921_225)
            expect(described_class.calc(100,  5, mod)).to eq( 75_287_520)
            expect(described_class.calc(100,  6, mod)).to eq(192_052_393)
            expect(described_class.calc(100,  7, mod)).to eq(  7_560_688)
            expect(described_class.calc(100,  8, mod)).to eq( 87_892_998)
            expect(described_class.calc(100,  9, mod)).to eq(231_795_086)
            expect(described_class.calc(100, 10, mod)).to eq(309_335_270)

            expect(described_class.calc(100, 50, mod)).to eq(538_992_043)

            expect(described_class.calc(100, 90, mod)).to eq(309_335_270)
            expect(described_class.calc(100, 91, mod)).to eq(231_795_086)
            expect(described_class.calc(100, 92, mod)).to eq( 87_892_998)
            expect(described_class.calc(100, 93, mod)).to eq(  7_560_688)
            expect(described_class.calc(100, 94, mod)).to eq(192_052_393)
            expect(described_class.calc(100, 95, mod)).to eq( 75_287_520)
            expect(described_class.calc(100, 96, mod)).to eq(  3_921_225)
            expect(described_class.calc(100, 97, mod)).to eq(    161_700)
            expect(described_class.calc(100, 98, mod)).to eq(      4_950)
          end
        end

        context 'k is n - 1' do
          it 'returns n' do
            expect(described_class.calc(  1,  0, mod)).to eq(  1)
            expect(described_class.calc(  2,  1, mod)).to eq(  2)
            expect(described_class.calc(  3,  2, mod)).to eq(  3)
            expect(described_class.calc(  4,  3, mod)).to eq(  4)
            expect(described_class.calc(  5,  4, mod)).to eq(  5)
            expect(described_class.calc(  6,  5, mod)).to eq(  6)
            expect(described_class.calc(  7,  6, mod)).to eq(  7)
            expect(described_class.calc(  8,  7, mod)).to eq(  8)
            expect(described_class.calc(  9,  8, mod)).to eq(  9)
            expect(described_class.calc( 10,  9, mod)).to eq( 10)

            expect(described_class.calc(100, 99, mod)).to eq(100)
          end
        end

        context 'k is n' do
          it 'returns 1' do
            expect(described_class.calc(  1,   1, mod)).to eq(1)
            expect(described_class.calc(  2,   2, mod)).to eq(1)
            expect(described_class.calc(  3,   3, mod)).to eq(1)
            expect(described_class.calc(  4,   4, mod)).to eq(1)
            expect(described_class.calc(  5,   5, mod)).to eq(1)
            expect(described_class.calc(  6,   6, mod)).to eq(1)
            expect(described_class.calc(  7,   7, mod)).to eq(1)
            expect(described_class.calc(  8,   8, mod)).to eq(1)
            expect(described_class.calc(  9,   9, mod)).to eq(1)
            expect(described_class.calc( 10,  10, mod)).to eq(1)

            expect(described_class.calc(100, 100, mod)).to eq(1)
          end
        end

        context 'k is greater than n' do
          it 'returns 0' do
            expect(described_class.calc(1, 2, mod)).to eq(0)
            expect(described_class.calc(2, 3, mod)).to eq(0)

            expect(described_class.calc(1, 100, mod)).to eq(0)
            expect(described_class.calc(2, 100, mod)).to eq(0)

            expect(described_class.calc(100, 101, mod)).to eq(0)
          end
        end
      end
    end
  end
end
