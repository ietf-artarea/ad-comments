# Orie Steele, ART AD, comments for draft-ietf-opsawg-prefix-lengths-08 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-opsawg-prefix-lengths-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### Signing Canonicalization & UTF-8

```
138	   prefixlen files are CSV (Comma Separated Values) files in UTF-8
139	   [RFC3629] text format; not HTML, richtext, or other formats.  Lines
140	   MUST be delimited by a line break (CRLF), and blank lines MUST be
141	   ignored.  Text from a '#' character to the end of the current line
142	   MUST be treated as a comment only and is similarly ignored.  The
143	   first field of each non-ignored line specifies the prefix in
144	   question, the second field the end-site prefix length within that
145	   prefix as an integer, and the third field the number of end-sites
146	   within an end-site prefix length for networks using Carrier-Grade NAT
147	   (CGN) [RFC6598].  Note that all three fields MUST be present.  This
148	   means there MUST be exactly two commas in each non-commented line
149	   delimiting the three fields.  The first field MUST NOT be empty on
150	   lines which are not comments, while the second and third field can be
151	   empty in certain scenarios.
```

... later ...

```
412	   The canonicalization procedure converts the data from their internal
413	   character representation to the UTF-8 [RFC3629] character encoding,
414	   and the <CRLF> sequence MUST be used to denote the end of each line
415	   of text.  A blank line is represented solely by the <CRLF> sequence.
416	   For robustness, any non-printable characters MUST NOT be changed by
417	   canonicalization.  Trailing blank lines MUST NOT appear at the end of
418	   the file.  That is, the file must not end with multiple consecutive
419	   <CRLF> sequences.  Any end-of-file marker used by an operating system
420	   is not considered to be part of the file content.  When present, such
421	   end-of-file markers MUST NOT be covered by the digital signature.
```

You might find https://datatracker.ietf.org/doc/rfc9839/ helpful for being more precise about the repertoire.

This text seems to suggest that the first and second fields can contain non-printable characters, and whitespace.

A more restricted ABNF might be helpful here.


