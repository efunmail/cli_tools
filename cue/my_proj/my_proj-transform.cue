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

// `for k,v ...` - 'field': https://cuelang.org/docs/tour/expressions/fieldcomp/
// `for itm ...` - 'list': https://cuelang.org/docs/tour/expressions/listcomp/
REC=obj_2: {
  for k, v in obj {(k): v}
  
  for k, v in obj 
    if k =~ #ListNameRegex
      let quote0 = REC[k + #ListQuoteSuffix]
      let quote = [ // 'switch' - https://cuelang.org/docs/howto/write-a-type-switch/
        if (quote0 & string) != _|_ {quote0},
        if (quote0 & string) == _|_ {""}, // DEFAULT: "" if quote0 NOT defined
      ][0] 
      let sep0 = REC[k + #ListSepSuffix]
      let sep = [
        if (sep0 & string) != _|_ {sep0},
        if (sep0 & string) == _|_ {","},
      ][0] {
        (strings.Split(k, "-")[0]):  // ORIG: strings.Join(v, sep)
          // Enclose each item in `quote`s 
          strings.Join([for itm in v {"\(quote)\(itm)\(quote)"}], sep)
      }
}
