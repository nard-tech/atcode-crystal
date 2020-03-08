#   ABC 158

2020-03-07 21:00 -

##  A - Station and Bus

AC

##  B - Count Balls

**WA** → AC

問題文をよく読むこと

```ruby
# WA

n, a, b = gets.chomp.split.map(&:to_i)
if a == 0
  puts 0
elsif b == 0
  puts n
else
  n_loops = (n / (a + b))
  # puts n_loops
  puts n - n_loops * b
end
```

```typescript
// WA

import * as fs from "fs";

const input = fs.readFileSync("/dev/stdin", "utf8").split(" ");
const n = +input[0];
const a = +input[1];
const b = +input[2];
// console.log(n);
// console.log(a);
// console.log(b);

if (a == 0) {
  console.log(0);
} else if (b == 0) {
  console.log(n);
} else {
  const n_loops = Math.floor(n / (a + b));
  console.log(n - n_loops * b);
}
```

##  C - Tax Increase

AC

##  D - String Formation

**TLE**

##  E - Divisible Substring

**未着手**

##  F - Removing Robots

**未着手**
