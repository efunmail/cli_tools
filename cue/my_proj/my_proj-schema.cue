// `package` - https://cuelang.org/docs/tour/packages/packages/
package my_proj

// ## Run - DEV
// $$ cue eval my_proj-schema* my_proj.yaml 

// ## Run 
// $$ cue export my_proj-schema* my_proj.yaml e 'obj' --out yaml # // ALT: json


obj: {
  //id: #BasicType
  //[=~ "^[_a-zA-Z][_a-zA-Z0-9]*$"]: #BasicType
  [=~ #WordRegex]: #BasicType

  suit: #SuitType

  //"files_list": [...string]
  [=~ #ListNameRegex]: [...string]
}
