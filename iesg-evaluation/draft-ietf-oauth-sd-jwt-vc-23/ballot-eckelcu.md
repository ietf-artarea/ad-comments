# Charles Eckel, ART AD, IESG ballot: draft-ietf-oauth-sd-jwt-vc-23
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-oauth-sd-jwt-vc-23.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks to Hannes Tschofenig for the Shepherd writeup, and to Christian Amsüss for the ARTART review. Thanks also to the authors for addressing his comments.

I support Mike Bishop's DISCUSS on the RFC 7800 sub/iss override.

## Comments

### BCP 14 keyword in Sections 2.2 and 2.2.2.5

```
278	   Note that in some cases, an SD-JWT VC MAY have no selectively
279	   disclosable claims, and therefore the encoded SD-JWT will not contain
280	   any Disclosures.
```

It does not seem like normative language was intended here. Consider using lowercase instead:

s/an SD-JWT VC MAY have/an SD-JWT VC can have

```
518	   An SD-JWT VC MAY have no selectively disclosable claims.  In that
519	   case, the SD-JWT VC MUST NOT contain the _sd claim in the JWT body.
520	   It also MUST NOT have any Disclosures.
```

The same applies to the first sentence of Section 2.2.2.5, and the MUST NOTs that follow state the actual requirement.

s/An SD-JWT VC MAY have/An SD-JWT VC can have

### BCP 14 keywords in Section 5.3.3

```
1185	   Ecosystems MAY define additional methods for retrieving Type
1186	   Metadata.  For example, a standardization body or a community MAY
1187	   define a service which has to be used to retrieve Type Metadata based
1188	   on a URN in the vct claim.
```

These MAYs apply to parties writing specifications rather than to protocol participants. Consider using lowercase instead:

s/Ecosystems MAY define/Ecosystems can define/
s/a community MAY define/a community can define/

### Character set for svg_id

```
1436	   *  svg_id: A string defining the ID of the claim for reference in the
1437	      SVG template, as described in Section 5.5.1.2.2.  The ID MUST be
1438	      unique within the type metadata.  It MUST consist of only
1439	      alphanumeric characters and underscores and MUST NOT start with a
1440	      digit.  It MUST NOT be used in a claim metadata object whose path
1441	      contains a null component, since such a path can select more than
1442	      one value.  This property is OPTIONAL.
```

Is alphanumeric specific enough? Perhaps better to replace with something like the following:

"It MUST consist only of the ASCII characters A-Z, a-z, 0-9, and underscore ("_"), and MUST NOT start with a digit."

It might also be helpful to state whether it is compared case-sensitively or not.
