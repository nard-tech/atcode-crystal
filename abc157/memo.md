#   ABC 157

2020-03-01 21:00 -

##  A - Duplex Printing

AC

*   `/` 演算子の，Crystal の version による違いに注意
*   `//` 演算子は Crystal 0.20.5 で動作しない
*   `c9b44cb`, `52a8ff1` は Crystal 0.20.5 でも正常に動作する

##  B - Bingo

AC

*   Crystal では `#include?` ではなく `#includes?`

##  C - Guess The Number

AC

*   「0は1桁の整数とする」に注意
    *   `numbers = (10 ** (n-1)).upto(10 ** n - 1).to_a` ではなく，`n > 1 ? (10 ** (n-1)).upto(10 ** n - 1).to_a : 0.upto(9).to_a` とする．

##  D - Friend Suggestions

**未着手**

##  E - Simple String Queries

**TLE**

*   愚直にコードに書き起こすと TLE となる．

##  F - Yakiniku Optimization Problem

**WA**，**要研究**

*   数学的に考察
