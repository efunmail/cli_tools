## Yazi

- Repo: https://github.com/sxyazi/yazi

### v25.5.31

- https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip
- // sha256sum:a2fdc9c35719fa72d94820893eb2fedd93fd1c418c2cf568702643526c358f7a

---

### v0.3.2

- `v0.3.2`
    - `x86_64-unknown-linux-musl`
        - https://github.com/sxyazi/yazi/releases/download/v0.3.2/yazi-x86_64-unknown-linux-musl.zip

```sh
sha256sum yazi-x86_64-unknown-linux-musl.zip 

c03a6b502fbd1aa9dcfabfc4b1b3770e801a1bf6579d6d50554e1376ec6dbf7b  yazi-x86_64-unknown-linux-musl.zip
```

### Config

- `yazi.toml`: https://yazi-rs.github.io/docs/configuration/yazi/
- `keymap.toml`: https://yazi-rs.github.io/docs/configuration/keymap/

```tree
~/.config/
          yazi/
               yazi.toml
               keymap.toml
```

### Plugins

https://yazi-rs.github.io/docs/plugins/overview/

```tree
~/.config/
          yazi/
               plugins/
                       MY_PLUGIN.yazi/
                                      init.lua
                                      LICENSE
                                      README.md
```
