## Cue EXPORT

### File Types

- `cue export --help`
> run 'cue help filetypes' for more info

```sh
$ cue help filetypes

The cue tools supports the following file types:

    Tag         Extensions      Description
    cue         .cue            CUE source files.
    json        .json           JSON files.
    yaml        .yaml/.yml      YAML files.
    toml        .toml           TOML files
    jsonl       .jsonl/.ndjson  Line-separated JSON values.
    jsonschema                  JSON Schema.
    openapi                     OpenAPI schema.
        pb                          Use Protobuf mappings (e.g. json+pb)
    textproto    .textproto     Text-based protocol buffers.
    proto        .proto         Protocol Buffer definitions.
    go           .go            Go source files.
    text         .txt           Raw text file; the evaluated value
                                must be of type string.
    binary                      Raw binary file; the evaluated value
                                must be of type string or bytes.

OpenAPI, JSON Schema and Protocol Buffer definitions are
always interpreted as schema. YAML and JSON are always
interpreted as data. CUE and Go are interpreted as schema by
default, but may be selected to operate in data mode.

The cue tool will infer a file's type from its extension by
default. The user my override this behavior by using qualifiers.
A qualifier takes the form

    <tag>{'+'<tag>}':'

For instance,

        cue eval json: foo.data

specifies that 'foo.data' should be read as a JSON file.

. . .

```
### Cue EXPORT - CONVERT...

- Convert YAML to **TOML**

```sh
cue export YAML.yaml --out toml
```
