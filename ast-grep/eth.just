# WIP...

# Tools - TODO: ast-grep yq
info-tools: # 

# Framework Versions - TODO:
info-versions:
  ## cake/VERSION.txt
  ## - `1.3.21`
  # (cat cake/VERSION.txt 2> /dev/null) | grep -v '//' # eg. 1.31.21
  # (cat lib/Cake/VERSION.txt 2> /dev/null) | grep -v '//' # eg. 2.10.24

  ## plugins/taltal-2.0/Vendor/phptal/PHPTAL.php
  ## - `define('PHPTAL_VERSION', '1_2_2');`

## 'View' FILES:
## - app/views/aaa/aaa.xml
## - app/views/aaa/app.js
# 'View' - (aaa.XML app.JS) 
app-Views-WIP:
  ast-grep -p 'axios.post($ENDPOINT, $$$_)' -r '/* $ENDPOINT */ axios.post($ENDPOINT, $$$_)' app/views/aaa/app.js -i
