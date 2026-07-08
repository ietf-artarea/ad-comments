# Charles Eckel, ART AD, IESG ballot for draft-ietf-idr-rfc4360-bis-08 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-idr-rfc4360-bis-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### Clarify last sentence of abstract

19	   This document obsoletes RFC 4360.  This document also updates RFC
20	   5701 by incorporating the operations section.

I found this sentence confusing. The way this is stated in Section 1 is more clear.

113	   This document obsoletes [RFC4360].  Section 6 of this document also
114	   applies to [RFC5701] and effectively updates it.

Consider using this same wording in the Abstract.

### Transitive Bit

176	            T - Transitive bit
177	               Value 0:  The community is transitive across ASes

179	               Value 1:  The community is non-transitive across ASes

whereas RFC 4271 has the following text:

         The second high-order bit (bit 1) of the Attribute Flags octet
         is the Transitive bit.  It defines whether an optional
         attribute is transitive (if set to 1) or non-transitive (if set
         to 0).

         For well-known attributes, the Transitive bit MUST be set to 1.
         (See Section 5 for a discussion of transitive attributes.)

I realize these are two different things, and I am not suggesting a normative change, but adding a non-normative "Note to Implementers" highlighting that the polarity of the Transitive bit in the Extended Community Type field is the opposite of the BGP Attribute Flags Transitive bit might be useful.




