# Raffle
## Challenge Info
I will not raffle anything…

File: `raffle`

## Build
### raffle
```
go build
```

### Generate main.go
I didn't calculate the answer when generating code, so you should modifiy by yourself.

Here is the steps:

```
python3 gen.py
```

Uncomment two lines in `main.go`: 
```
// input = []byte("w3_4r3_901ng_70_raffl3_0fF_A_g0...g0-r0u71n3!")
// fmt.Println(input)
```

```
go build
./raffle "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
```

Paste the output into `ans := []byte{...}`.

## Writeup
- [2021 AIS3 EOF FINAL - MUGYU, RAFFLE 官方解](https://artis24106.github.io/blog/posts/2021-ais3-eof-final/mugyuraffle/)