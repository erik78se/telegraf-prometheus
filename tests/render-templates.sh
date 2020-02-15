#!/bin/bash
set -e
errors=0

source ../lib/utils

### TEST 1 - render
X=BANANA
result=$(render "testing-template.tmpl")
if [ ! "${result}" == "Hej BANANA" ]; then
  echo "utils.render returned[($result}] I expected: [Hej BANANA]" 2>&1
  let errors+=1
fi

[ "$errors" -gt 0 ] && {
  echo "There were $errors errors found"
  exit 1
}