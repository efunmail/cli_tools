## CUE file, and DATA file(s)

- `wip.cue`

```cue
import "strings"

// ** DEFINE structure
obj: {
  files: [...string]

  // ** CONVERT list to CSV
  // // INFO: `Join` - https://pkg.go.dev/cuelang.org/go/pkg/strings#Join
  files_list: strings.Join(obj.files, ",")
}
```

- `y1.yaml`

```yaml
id: 123
name: Ami

obj:
  x: 456
  pet: Cat

  files:
  - ldap.json
  - 'pre.json:...'
  - staff.json
```

----

## Cue - UNIFY...

```sh
cue export wip.cue y1.yaml --out yaml
#cue export wip.cue y1.yaml --out cue

# // Expression: 'obj'
cue export wip.cue y1.yaml --out yaml -e 'obj'
```
