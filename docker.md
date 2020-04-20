# Docker コンテナの作成

```sh
docker run --name crystal-0.20.5 -v ~/development/Projects/AtCoder/AtCoderCrystal:/home/AtCoderCrystal -w /home/AtCoderCrystal -it crystallang/crystal:0.20.5 /bin/bash
docker run --name crystal-0.33.0 -v ~/development/Projects/AtCoder/AtCoderCrystal:/home/AtCoderCrystal -w /home/AtCoderCrystal -it crystallang/crystal:0.33.0 /bin/bash
```
