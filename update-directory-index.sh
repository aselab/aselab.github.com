#!/bin/bash

for DIR in $(find maven -type d); do
  (
    echo -e "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<div>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }'
    echo -e "</div>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done
