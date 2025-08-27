## AST-Grep

- [Playground](https://ast-grep.github.io/playground.html#eyJtb2RlIjoiQ29uZmlnIiwibGFuZyI6InlhbWwiLCJxdWVyeSI6ImNvbnNvbGUubG9nKCRNQVRDSCkiLCJyZXdyaXRlIjoibG9nZ2VyLmxvZygkTUFUQ0gpIiwic3RyaWN0bmVzcyI6InNtYXJ0Iiwic2VsZWN0b3IiOiIiLCJjb25maWciOiJpZDogenBuLWNoZWNrLWFycmF5LWl0ZW0taXMtZmlyc3Rcbmxhbmd1YWdlOiB5YW1sXG5tZXNzYWdlOiB8LVxuICBDaGVjayBpZiBhICdwbHVnaW4nIHZhbHVlIGlzIEZJUlNULi4uXG4gXG4jIC8vIEZpbmQgcGF0dGVybiAqaW5zZGUqIGBwbHVnaW5zOmAgd2l0aCBpdGVtICpiZWZvcmUqIGl0XG5ydWxlOlxuICBhbGw6XG4gICAgLSBwYXR0ZXJuOiAnLSAkVkFMJ1xuICAgIC0gaW5zaWRlOlxuICAgICAgICBwYXR0ZXJuOiAncGx1Z2luczonXG4gICAgICAgIGtpbmQ6IGJsb2NrX21hcHBpbmdfcGFpclxuICAgICAgICBzdG9wQnk6IHtraW5kOiBibG9ja19tYXBwaW5nX3BhaXJ9XG4gICAgLSBmb2xsb3dzOlxuICAgICAgICAgIGtpbmQ6IGJsb2NrX3NlcXVlbmNlX2l0ZW1cblxuY29uc3RyYWludHM6XG4gIFZBTDpcbiAgICByZWdleDogJ29ic2lkaWFuLWludGVyYWN0aXZlLWdyYXBoJyAgXG5cbmZpeDogfC1cbiAgLSAkVkFMICMgV0lQIiwic291cmNlIjoibXNnOiBIZWxsb1xucGx1Z2luczpcbiAgLSBwbHVnaW4tMDAxXG4gIC0gb2JzaWRpYW4taW50ZXJhY3RpdmUtZ3JhcGhcbiAgLSBwbHVnaW4tMDAzXG4gIC0gbXNnOiBIZWxsbyJ9)

- Rule:

```yaml
id: zpn-check-array-item-is-first
language: yaml
message: |-
  Check if a 'plugin' value is FIRST...
 
# // Find pattern *insde* `plugins:` with item *before* it
rule:
  all:
    - pattern: '- $VAL'
    - inside:
        pattern: 'plugins:'
        kind: block_mapping_pair
        stopBy: {kind: block_mapping_pair}
    - follows:
          kind: block_sequence_item

constraints:
  VAL:
    regex: 'obsidian-interactive-graph'  

fix: |-
  - $VAL # WIP
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
