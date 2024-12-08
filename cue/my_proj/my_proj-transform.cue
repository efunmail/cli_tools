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
      let sep0 = REC[k + #ListSepSuffix]
      let sep = [ // 'switch' - https://cuelang.org/docs/howto/write-a-type-switch/
        if (sep0 & string) != _|_ {sep0},
        if (sep0 & string) == _|_ {","}, // DEFAULT: "," if sep0 NOT defined
      ][0] {
        (strings.Split(k, "-")[0]):
          strings.Join(v, sep)
      }
}
