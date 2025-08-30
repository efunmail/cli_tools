## Comby

https://comby-live.fly.dev

- Aim: To **extract** components of each PHP function/method (into a **structured** format, eg. JSON)

### WIP

- *Match* template

```php
function :[FUNC](:[ARGS]) {
  :[PREP]

  $SQL = <<<QQQ
  :[SQL_]
  QQQ;

  :[RET]

  return :[RETURN]
}
```

- *Rewrite* template

```yaml
/*
FUNC: :[FUNC]
ARGS: :[ARGS]

PREP: :[PREP]
SQL:  :[SQL_]

RET:  :[RET]
RETURN: :[RETURN]
*/
```
