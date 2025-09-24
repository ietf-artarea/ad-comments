# Orie Steele, ART AD, comments for draft-ietf-lamps-pkcs8-prikeyinfo-contenttypes-01 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-lamps-pkcs8-prikeyinfo-contenttypes-01.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thank you to Gonzalo Salgueiro for the ARTART review.

## Comments

### Media types

```
81	   The syntax for private-key information was originally described in
82	   [RFC5208] and later obsoleted by [RFC5958].  This document defines
83	   PKCS #8 content types for use with PrivateKeyInfo and
84	   EncryptedPrivateKeyInfo.
```

See RFC 2046 for the history of MIME / media types.

Consider: 
https://www.iana.org/assignments/media-types/application/pkcs8

Based on the abstract, I was expecting to see media types here, but it seems content types have a specific meaning in the context of lamps.

Am I correct to assume that "application/pkcs8" can carry both PrivateKeyInfo and EncryptedPrivateKeyInfo?

A sentence relating these oids to the existing registered media types might be helpful.

