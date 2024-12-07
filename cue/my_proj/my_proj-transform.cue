// `package` - https://cuelang.org/docs/tour/packages/packages/
package my_proj

// ## Run - DEV
//    cue eval my_proj-schema* my_proj-transform* my_proj.yaml
//    cue eval my_proj-schema* my_proj-transform* 
//    cue eval my_proj* 

// ## Run 
// $$ cue export ... 



// TODO: strings.Join(...) - can define in `...-tranform-defs.cue` ??
//       =================
obj_2: {
  for k, v in obj {(k): v}
  
}
