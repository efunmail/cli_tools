## RUNME

## runme

TUI - (DEFAULT)

```sh {tag=runme name=runme-tui}
runme --filename pn.md tui
```

RUN 

```sh {tag=runme name=runme-run}
runme --filename pn.md run hello -y
```

RUN 'tag pattern'

```sh {tag=runme name=runme-run--tag-pattern}
runme --filename pn.md run -e -t 'hiy' -y
```

PRINT 'raw'

```sh {tag=runme name=runme-print--raw}
runme --filename pn.md print runme-tui --raw
```

### Play

<!-- ALT: metadata: {"name":"hello", "tag":"hiya"} -->

Bash, with `export` ENV var

```sh {tag=hiya name=hello hl_lines="1-2,4"}
export MSG='Hello, world!'
echo $MSG
```

```sh
echo 'Hello, world! - UNNAMED' 
```

```sh {tag=hiya name=hello2}
echo "$MSG - 2"
```

WIP - NO?!

```bash {name=shebang-py}
#!/usr/bin/env python3
print
```

Python

```python {name=py-environ}
import os

print(f'{os.environ["MSG"] =}')
```
