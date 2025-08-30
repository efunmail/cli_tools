# WIP...

# Tools - TODO: ast-grep yq
info-tools: # 

# Framework Versions - TODO:
info-versions:
  #!/usr/bin/env bash

## 'View' FILES:
## - app/views/aaa/aaa.xml
## - app/views/aaa/app.js
# 'View' - (aaa.XML app.JS) 
app-Views-WIP:
  ast-grep -p 'axios.post($ENDPOINT, $$$_)' -r '/* $ENDPOINT */ axios.post($ENDPOINT, $$$_)' app/views/aaa/app.js -i
