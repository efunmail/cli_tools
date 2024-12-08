// `package` - https://cuelang.org/docs/tour/packages/packages/
package my_proj

// ## Run - DEV
//    cue eval my_proj-schema* my_proj-transform* my_proj.yaml
//    cue eval my_proj-schema* my_proj-transform* 
//    cue eval my_proj* 

//    cue export my_proj-schema* my_proj.yaml my_proj-transform -e 'obj_2'
//    // TODO: can CHANGE obj_2 - using YQ or JQ ??

// ## Run 
// $$ cue export ... 

import "strings"


REC=obj_2: {
  for k, v in obj {(k): v}
  
  for k, v in obj 
    if k =~ #ListNameRegex
      let fieldSepName = "\(k)-sep" { // TODO: DEFINE '-sep'
      //let sep = REC[fieldSepName] { 
      //let sep = {if {val, ok := REC[fieldSepName]; ok} {val} else {","}} { 
      //let sep = (if (1 == 2) "|" else ",") { 
      //let sep = {true: "|", false: ","}[if 1 == 2 ] { 
        (strings.Split(k, "-")[0]): strings.Join(v, REC[fieldSepName]) // ","
        //(strings.Split(k, "-")[0]): strings.Join(v, (if val, ok := REC[fieldSepName]; ok {val} else {","}))
        //(strings.Split(k, "-")[0]): if {1 == 1} {1}
      }
}
