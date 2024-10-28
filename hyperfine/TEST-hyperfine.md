## Parameterized Benchmarks

https://github.com/sharkdp/hyperfine#parameterized-benchmarks

- `--parameter-scan`
    - `-D` / `--parameter-step-size`
- `-L`

### srgn

https://github.com/efunmail/cli_tools/blob/main/srgn/TEST-srgn.md

```sh
hyperfine --runs 3 -L THREADS 1,2,4,8,16  "srgn --go strings '\d+' --threads {THREADS} > srgn--go-strings-NUM--threads-{THREADS}-hyper.txt"
```

#### Output:

```
Benchmark 1: srgn --go strings '\d+' --threads 1 > srgn--go-strings-NUM--threads-1-hyper.txt
  Time (mean ± σ):     21.287 s ±  0.076 s    [User: 20.911 s, System: 0.362 s]
  Range (min … max):   21.239 s … 21.374 s    3 runs
 
  Warning: Statistical outliers were detected. Consider re-running this benchmark on a quiet system without any interferences from other programs. It might help to use the '--warmup' or '--prepare' options.
 
Benchmark 2: srgn --go strings '\d+' --threads 2 > srgn--go-strings-NUM--threads-2-hyper.txt
  Time (mean ± σ):     10.862 s ±  0.182 s    [User: 21.306 s, System: 0.389 s]
  Range (min … max):   10.729 s … 11.070 s    3 runs
 
Benchmark 3: srgn --go strings '\d+' --threads 4 > srgn--go-strings-NUM--threads-4-hyper.txt
  Time (mean ± σ):      5.889 s ±  0.123 s    [User: 23.039 s, System: 0.440 s]
  Range (min … max):    5.751 s …  5.987 s    3 runs
 
Benchmark 4: srgn --go strings '\d+' --threads 8 > srgn--go-strings-NUM--threads-8-hyper.txt
  Time (mean ± σ):      3.819 s ±  0.004 s    [User: 29.765 s, System: 0.549 s]
  Range (min … max):    3.814 s …  3.823 s    3 runs
 
Benchmark 5: srgn --go strings '\d+' --threads 16 > srgn--go-strings-NUM--threads-16-hyper.txt
  Time (mean ± σ):      3.112 s ±  0.005 s    [User: 47.384 s, System: 0.981 s]
  Range (min … max):    3.109 s …  3.118 s    3 runs
 
Summary
  srgn --go strings '\d+' --threads 16 > srgn--go-strings-NUM--threads-16-hyper.txt ran
    1.23 ± 0.00 times faster than srgn --go strings '\d+' --threads 8 > srgn--go-strings-NUM--threads-8-hyper.txt
    1.89 ± 0.04 times faster than srgn --go strings '\d+' --threads 4 > srgn--go-strings-NUM--threads-4-hyper.txt
    3.49 ± 0.06 times faster than srgn --go strings '\d+' --threads 2 > srgn--go-strings-NUM--threads-2-hyper.txt
    6.84 ± 0.03 times faster than srgn --go strings '\d+' --threads 1 > srgn--go-strings-NUM--threads-1-hyper.txt
```

- NOTE:

> Warning: Statistical outliers were detected.

> Consider re-running this benchmark on a quiet system
> without any interferences from other programs.

> It might help to use the `--warmup` or `--prepare` options.
 
