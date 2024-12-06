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

meta:
  catgs: [...string]
  langs: [...string]

// ** Define ('enum') DISJUNCTION using `or` - with default `[0]` 
// REF: https://cuelang.org/docs/howto/use-the-built-in-function-or/
#CatgEnum: *meta.catgs[0] | or(meta.catgs[1:])
#LangEnum: *meta.langs[0] | or(meta.langs[1:])



// TODO: separate file - cli_tools-INSTALL.cue ??
//#InstallStruct: {
//  kind: "TAR" | "ZIP"    // TODO: enum
//  dir: *1 | int
//  do_install: string
//}

// ** "Disjunctions of Structs"
// REF: https://cuelang.org/docs/tour/types/sumstruct/
#InstallStruct: {
  kind: "TAR"
  dir: *1 | int
  do_install: """
    tar xf ARC_FILE --directory \(dir) ...

    sudo cp -p PATH/EXE \(BIN_DIR)/EXE
    """
} | {
  kind: "ZIP"
  dir: *1 | int
  do_install: """
    unzip ARC_FILE ... # \(dir)

    sudo cp -p PATH/EXE \(BIN_DIR)/EXE
    """
}


#VersionStruct: {
  ver: string
  //date: string
  uri: string
  inst_kind: *"DEFAULT_KIND" | string  // TODO: enum
  install: #InstallStruct

}

#ToolStruct: {
  id:      string & =~"[a-z][_a-z0-9]+" 
  catg:    #CatgEnum
  repo:    string
  desc:    string
  versions: [...#VersionStruct]
  //install: string // TODO: ...

  _WIP0: string
}

tools:
  // ** Define ALIAS - `T=...`
  // REF: https://cuelang.org/docs/tour/expressions/dynamic-fields/
  [ID=_]: T=#ToolStruct & {
    id:      ID

    _WIP0: """
      \(T.versions[0].install.kind)
      """
  }
