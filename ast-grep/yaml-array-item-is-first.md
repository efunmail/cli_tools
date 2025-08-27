## AST-Grep

- [Playground](https://ast-grep.github.io/playground.html#eyJtb2RlIjoiQ29uZmlnIiwibGFuZyI6InlhbWwiLCJxdWVyeSI6ImNvbnNvbGUubG9nKCRNQVRDSCkiLCJyZXdyaXRlIjoibG9nZ2VyLmxvZygkTUFUQ0gpIiwic3RyaWN0bmVzcyI6InNtYXJ0Iiwic2VsZWN0b3IiOiIiLCJjb25maWciOiJpZDogenBuLWNoZWNrLWFycmF5LWl0ZW0taXMtZmlyc3Rcbmxhbmd1YWdlOiB5YW1sXG5tZXNzYWdlOiB8LVxuICBDaGVjayBpZiBhICdwbHVnaW4nIHZhbHVlIGlzIEZJUlNULi4uXG4gXG4jICoqIEZpbmQgSVRFTSAqaW5zZGUqIEFSUkFZLCB3aXRoIGl0ZW0ocykgKmJlZm9yZSogaXQgXG5ydWxlOlxuICBhbGw6XG4gICAgLSBwYXR0ZXJuOiAnLSAkSVRFTSdcbiAgICAtIGluc2lkZTpcbiAgICAgICAgcGF0dGVybjogJyRBUlJBWTonXG4gICAgICAgIGtpbmQ6IGJsb2NrX21hcHBpbmdfcGFpclxuICAgICAgICBzdG9wQnk6IHtraW5kOiBibG9ja19tYXBwaW5nX3BhaXJ9XG4gICAgLSBmb2xsb3dzOlxuICAgICAgICAgIGtpbmQ6IGJsb2NrX3NlcXVlbmNlX2l0ZW1cblxuIyAvLyBUT0RPOiAqSW5zdGVhZCogb2YgY29uc3RyYWludHMsIGNhbiB1c2UgRU5WIHZhcnMgKCYgZW52c3Vic3QpXG5jb25zdHJhaW50czpcbiAgQVJSQVk6IHsgcmVnZXg6ICdwbHVnaW5zJyB9XG4gIElURU06IHsgcmVnZXg6ICdvYnNpZGlhbi1pbnRlcmFjdGl2ZS1ncmFwaCcgfVxuXG5maXg6IHwtXG4gIC0gJElURU0gIyBXSVAiLCJzb3VyY2UiOiJtc2c6IEhlbGxvXG5wbHVnaW5zOlxuICAtIHBsdWdpbi0wMDFcbiAgLSBvYnNpZGlhbi1pbnRlcmFjdGl2ZS1ncmFwaFxuICAtIHBsdWdpbi0wMDNcbiAgLSBtc2c6IEhlbGxvIn0=)

- Rule:

```yaml
id: zpn-check-array-item-is-first
language: yaml
message: |-
  Check if a 'plugin' value is FIRST...
 
# ** Find ITEM *insde* ARRAY, with item(s) *before* it 
rule:
  all:
    - pattern: '- $ITEM'
    - inside:
        pattern: '$ARRAY:'
        kind: block_mapping_pair
        stopBy: {kind: block_mapping_pair}
    - follows:
          kind: block_sequence_item

# // TODO: *Instead* of constraints, can use ENV vars (& envsubst)
constraints:
  ARRAY: { regex: 'plugins' }
  ITEM: { regex: 'obsidian-interactive-graph' }

fix: |-
  - $ITEM # WIP
```

- Example:

```yaml
msg: Hello
plugins:
  - plugin-001
  - obsidian-interactive-graph
  - plugin-003
  - msg: Hello
```

https://github.com/daxcore/mkdocs-obsidian-interactive-graph-plugin#setup-in-mkdocs

> [!NOTE]
> ... but note that this plugin has to be **located before** plugins
> that replace wikilinks by markdown links.
