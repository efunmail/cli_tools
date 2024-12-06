// ## RUN
// ** DEV...
// $$ cue eval cli_tools* 
// $$ cue eval cli_tools* -e 'tools'
//
// ** FINAL
// $$ cue export cli_tools* -e 'tools'
// $$ cue export cli_tools* -e 'tools' --out yaml
// $$ cue export cli_tools* -e 'tools' --out toml


// ## System info
// https://cuelang.org/docs/howto/inject-system-information-into-evaluation-using-tag-variable/
CWD: string @tag(_cwd, var=cwd)

// ** Can provide value on cmd-line:
// $$ cue eval -t 'MSG="Hello, world!"' ...
msg: *"Hiya!" | string @tag(MSG)


BIN_DIR: *"/usr/local/bin" | string @tag(BIN_DIR)

#VersionStruct: {
  ver: string
  //date: string
  uri: string
  inst_kind: *"DEFAULT_KIND" | string  // TODO: enum
}

#ToolStruct: {
  id:      string // TODO: regex (alphanumeric)
  catg:    *"CATEGORY" | string // TODO: enum
  repo:    string
  desc:    string
  versions: [...#VersionStruct]
  //install: string // TODO: ...
}

tools:
  [ID=_]: #ToolStruct & {
    id:      ID
    //install: "sudo cp -p PATH/EXE \(BIN_DIR)/EXE"
  }