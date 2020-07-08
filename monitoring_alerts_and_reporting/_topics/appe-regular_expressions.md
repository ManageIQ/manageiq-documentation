# Regular Expressions

In {{ site.data.product.title }}, regular expressions can be used to search the
contents of a file for a specific string for use in a condition. Below
are listed the items most commonly used with {{ site.data.product.title }} to search
strings. These are a small subset of all the items available to use in
regular expressions. If you are unfamiliar with regular expressions,
there are many resources available on the Internet, including
[www.regular-expressions.info](http://www.regular-expressions.info/).
Note that if you want to search a file, you must collect it as part of a
host analysis profile.

|                                  |                                                                                 |
| -------------------------------- | ------------------------------------------------------------------------------- |
| Anchors                          |                                                                                 |
| ^                                | start of string                                                                 |
| $                                | end of string                                                                   |
| Character Classes                |                                                                                 |
| \\s                              | white space including spaces, tabs, and line breaks                             |
| \\S                              | not white space                                                                 |
| \\d                              | digit, same as \[0-9\]                                                          |
| \\D                              | not digit                                                                       |
| \\w                              | word                                                                            |
| \\W                              | not word                                                                        |
| Quantifiers                      |                                                                                 |
| \*                               | 0 or more of preceding characters                                               |
| \+                               | 1 or more of preceding characters                                               |
| ?                                | 0 or 1 of preceding character                                                   |
| Escape Character                 |                                                                                 |
| \\                               | put before a metacharacter to search for that actual character                  |
| Metacharacters                   |                                                                                 |
| ^ \[ . $ { \* ( \\ + ) | ? \< \> | must be used with the Escape Character if you are searching specifically for it |
| Special characters               |                                                                                 |
| \\n                              | new line                                                                        |
| \\t                              | tab                                                                             |
| Groups and Ranges                |                                                                                 |
| .                                | any character except new line (\\n)                                             |
| (a|b)                            | a or b                                                                          |
| ()                               | group                                                                           |
| \[abc\]                          | a or b or c                                                                     |
| \[^abc\]                         | not a or b or c                                                                 |
| \[a-q\]                          | letter between a and q                                                          |
| \[A-Q\]                          | upper case letter between A and Q                                               |
| \[0-7\]                          | digit between 0 and 7                                                           |
| Pattern modifiers                |                                                                                 |
| i                                | case insensitive                                                                |
| Other helpers                    |                                                                                 |
| .\*                              | swallows text between 2 words                                                   |
| \\s+                             | guarantees minimum of 1 whitespace between 2 words                              |
| \\s\*                            | guarantees 0 or more whitespace between 2 words                                 |
| ^\\s\*                           | beginning of line with zero or more whitespace                                  |
| \\s+.\*                          | swallows all text and white space between 2 words                               |
| \\d+                             | guarantees minimum of 1 number between 2 words                                  |
| \<\\w\>                          | identical to \<\[a-zA-Z0-(\_\]\>                                                |

Regular Expressions

|                                                                                                                                  |                                                                        |
| -------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Description                                                                                                                      | Regular Expression                                                     |
| (\[a-zA-Z0-9\]+)                                                                                                                 | Letters, numbers, hyphens                                              |
| Find the line beginning with `sshd`. Then, using a colon `:` as delimiter, check that the value four ":" over is equal to 99999. | ^sshd:\[^:\]\*:\[^:\]\*:\[^:\]\*:99999:                                |
| Verify that `PASS_MAX_DAYS` exists starting in position `1` and a value after it is ⇐ 90.                                        | ^\\s\*PASS\_MAX\_DAYS\\s+(\[0-9\]|\[1-8\]\[0-9\]|90)                   |
| Verify that `ROOTPW` (in any case) exists on an uncommented line.                                                                | /<sup>\[</sup>\#\]\*ROOTPW/i                                           |
| Verify that line in file starts with size and the value after is ⇐ 4096k.                                                        | ^\\s\*size\\s+(409\[0-6\]|40\[0-8\]\[0-9\]|\[123\]\[09\]{3}|\\d{1,3})k |
| Find line with string `restrict 127.0.0.1` that starts in position \`1 to ensure it is not commented out.                        | ^\\s\*restrict\\s+127\\.0\\.0\\.1                                      |
| Find an uncommented line that contains `/home`. There will be additional text before the desired string.                         | <sup>\[</sup>\#\]\*\\/home                                             |

Examples
