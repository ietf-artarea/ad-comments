# Andy Newton, ART AD, comments for draft-ietf-suit-update-management-13 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-suit-update-management-13.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Thanks to the Reviewers

Thanks to Russ Housley for the ARTART review.

## Comments

### UTF-8 printable characters

268	   documentation provides the necessary context.  Values in this field
269	   MUST be encoded as UTF-8 text limited to printable characters, and

Should this also refer to the categories as is done on line 234?

And again here?

551	   Unless otherwise stated, all string values in this structure MUST be
552	   encoded as UTF-8 without control characters (Unicode general
553	   categories Cc or Cf) and SHOULD be limited to human-readable
554	   identifiers such as names or POSIX-style paths.  Binary values

Would it be worth referring to Unicode Assignables in Section 4.3 of RFC 9839?

