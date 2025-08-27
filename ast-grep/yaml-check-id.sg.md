## AST-Grep

- [Playground](https://ast-grep.github.io/playground.html#eyJtb2RlIjoiQ29uZmlnIiwibGFuZyI6InlhbWwiLCJxdWVyeSI6ImNvbnNvbGUubG9nKCRNQVRDSCkiLCJyZXdyaXRlIjoibG9nZ2VyLmxvZygkTUFUQ0gpIiwic3RyaWN0bmVzcyI6InNtYXJ0Iiwic2VsZWN0b3IiOiIiLCJjb25maWciOiJpZDogenBuLWNoZWNrLWlkXG5sYW5ndWFnZTogeWFtbFxubWVzc2FnZTogfC1cbiAgQ2hlY2sgaWYgYW4gYGlkYCB2YWx1ZSBFWElTVFMuLi5cbiBcbnJ1bGU6XG4gICBwYXR0ZXJuOiAnaWQ6ICRJRCdcbmNvbnN0cmFpbnRzOlxuICBJRDpcbiAgICByZWdleDogJzQnICMgLy8gYGlkYCB2YWx1ZVxuXG5maXg6IHwtXG4gIGlkOiAkSUQiLCJzb3VyY2UiOiIjIC8vIENhbiBjb252ZXJ0IENTViB0byAoSlNPTiB0bykgWUFNTFxuLSBpZDogJzEnXG4gIHBlcmlvZDogJzIwMTcnXG4tIGlkOiAnMidcbiAgcGVyaW9kOiAnMjAxOCdcbi0gaWQ6ICczJ1xuICBwZXJpb2Q6ICcyMDE5J1xuLSBpZDogJzQnXG4gIHBlcmlvZDogMjAyMCJ9)

- Rule

```yaml
id: zpn-check-id
language: yaml
message: |-
  Check if an `id` value EXISTS...
 
rule:
   pattern: 'id: $ID'
constraints:
  ID:
    regex: '4' # // `id` value

fix: |-
  id: $ID
```

- Example

```yaml
# // Can convert CSV to (JSON to) YAML
- id: '1'
  period: '2017'
- id: '2'
  period: '2018'
- id: '3'
  period: '2019'
- id: '4'
  period: 2020
```
