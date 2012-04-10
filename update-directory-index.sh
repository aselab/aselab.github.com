#!/bin/bash

for DIR in $(find maven -type d); do
  (
    echo -e "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<ul>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<li><a href=\"%s\">%s</a></li>\n",$1,$1 }'
    echo -e "</ul>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done
