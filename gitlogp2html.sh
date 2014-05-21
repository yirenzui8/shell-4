# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

echo "<pre style=\"white-space:pre-wrap\">" > diff.html
git log -p --no-color --word-diff=porcelain \
| sed 's/>/\&gt;/g' \
| sed 's/</\&lt;/g' \
| sed 's/^commit\(.*\)$/<span style="color:orange">commit\1<\/span>/' \
| sed 's/^@@ \([^@]*\) @@/<span style="color:blue">@@ \1 @@<\/span>/' \
| sed 's/^-\(.*\)$/<span style="color:red">-\1<\/span>/' \
| sed 's/^+\(.*\)$/<span style="color:green">+\1<\/span>/' \
>> diff.html
echo "</pre>" >> diff.html
