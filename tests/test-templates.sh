#!/bin/bash
set -e
errors=0

#
# Use for testing rendering functionality (render).
#

source ../lib/utils
tmpf=$(mktemp)
render testing-template.tmpl > ${tmpf} 2> /dev/null
echo "--------Contents of rendered testing-template.tmpl-----"
cat ${tmpf}
echo "-------------------------------------------------------"
rm ${tmpf}
