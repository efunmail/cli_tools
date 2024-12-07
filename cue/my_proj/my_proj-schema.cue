// `package` - https://cuelang.org/docs/tour/packages/packages/
package my_proj

// ## Run - DEV
// $$ cue eval my_proj-schema* my_proj.yaml 

// ## Run 
// $$ cue export my_proj-schema* my_proj.yaml e 'obj' --out yaml # // ALT: json

obj: {
  id:   #BasicType
  suit: #SuitType
}
