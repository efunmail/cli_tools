## "Working recursively"

https://github.com/alexpovel/srgn#working-recursively

> For example, `srgn --go strings '\d+'` finds and prints all ~140,000 runs
> of digits in literal Go strings inside the [Kubernetes codebase](https://github.com/kubernetes/kubernetes/tree/5639f8f848720329f4a9d53555a228891550cb79)
> of ~3,000,000 lines of Go code *within 3 seconds* on 12 cores of M3.

### Quick test - (time)

```sh
COMMIT_HASH=5639f8f848720329f4a9d53555a228891550cb79
wget https://github.com/kubernetes/kubernetes/archive/$COMMIT_HASH.zip

unzip $COMMIT_HASH.zip 
cd kubernetes-$COMMIT_HASH

time srgn --go strings '\d+' > srgn--go-strings-NUM.txt
```
