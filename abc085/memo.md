#   ABC 085

##  B - Kagami Mochi

AC

*   配列の初期化

```crystal
Array(Int64).new(n) { read_line.to_i64 }
```

##  C - Otoshidama

AC

*   大域脱出 (cf. `c2.cr`)
    *   `exit` を `break` とすると WA となる
*   `c2.cr` の方が `c1.cr` よりもパフォーマンスがよい
