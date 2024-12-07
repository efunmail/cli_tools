// ## RUN:
// $$ cue eval _zp_proj.cue _zp_proj.yaml
// $$ cue export _zp_proj.cue _zp_proj.yaml --out yaml

import "strings"

#BasicType: string | int

//ZP: [!="FILES"]: #BasicType // OKAY
 
ZP: FILES: [...string]
// ** CONVERT list to CSV
ZP: FILES_LIST: strings.Join(ZP.FILES, ",")
//  ==========

// INFO: RAW strings - https://cuelang.org/docs/tour/types/stringraw/
// _BS: #"\"#


ZP:
  DOCKER=docker: {
    img_base: string

    pkgs_install: """
       RUN apt-get update \\
        && apt-get install -y \\
             \( strings.Join(DOCKER.pkgs, "\n      ") )
       """
  }
