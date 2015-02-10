# vps-bench
quick cli benchmark of network, disk, and cpu

## Example output:
```
network bench
Ping: 36.311 ms
Download: 76.01 Mbits/s
Upload: 14.57 Mbits/s

disk bench
  seq-read | reads:   144551 KB/s    36137 iops     46 μs | writes:        0 KB/s        0 iops      0 μs
 rand-read | reads:   131039 KB/s    32759 iops    104 μs | writes:        0 KB/s        0 iops      0 μs
 seq-write | reads:        0 KB/s        0 iops      0 μs | writes:    21321 KB/s    10000 iops  69360 μs
rand-write | reads:        0 KB/s        0 iops      0 μs | writes:    16481 KB/s    10000 iops  54464 μs

cpu bench
ghash 8KiB blocks: 2.4GiB/s
```
