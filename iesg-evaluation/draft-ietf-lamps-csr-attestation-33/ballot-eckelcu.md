# Charles Eckel, ART AD, IESG ballot: draft-ietf-lamps-csr-attestation-33
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-lamps-csr-attestation-33.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks to Sean Turner for his ARTART review.

## Nits

### Formats vs. messages in Section 1

This sentence mentions both formats and messages. I suggest sticking to
one.

CURRENT:

```
124	   This specification defines an attribute and an extension that allow
125	   for conveyance of verifiable attestations in several Certificate
126	   Signing Request (CSR) formats, including PKCS#10 [RFC2986] or
127	   Certificate Request Message Format (CRMF) [RFC4211] messages.  Given
```

PROPOSED:

```
124	   This specification defines an attribute and an extension that allow
125	   for conveyance of verifiable attestations in several Certificate
126	   Signing Request (CSR) formats, including PKCS#10 [RFC2986] and
127	   Certificate Request Message Format (CRMF) [RFC4211].  Given
```

### Time-sensitive text in the Abstract

The Abstract will be permanent; "currently underway" will not age well, and
[RFC9334] is already published.

CURRENT:

```
26	   attestation.  While work is currently underway to standardize various
27	   aspects of remote attestation, a variety of proprietary mechanisms
28	   have been in use for years, particularly regarding protection of
29	   private keys.
```

PROPOSED:

```
26	   attestation.  While various aspects of remote attestation have been
27	   standardized, a variety of proprietary mechanisms have been in use
28	   for years, particularly regarding protection of private keys.
```

### "i.e." vs "e.g." and list punctuation

ASN.1 and CDDL are examples of "any data description language", so "e.g." is
intended. The list of encodings is also missing a conjunction, and "and" fits
better than "or" between "defined" and "represented".

CURRENT:

```
139	   attestations may be defined using any data description language,
140	   i.e., ASN.1 or Concise Data Description Language (CDDL), or
141	   represented using any type of encoding, including Distinguished
142	   Encoding Rules (DER), Concise Binary Object Representation (CBOR),
143	   JavaScript Object Notation (JSON).  The requirements for carrying
```

PROPOSED:

```
139	   attestations may be defined using any data description language,
140	   e.g., ASN.1 or Concise Data Description Language (CDDL), and
141	   represented using any type of encoding, including Distinguished
142	   Encoding Rules (DER), Concise Binary Object Representation (CBOR),
143	   and JavaScript Object Notation (JSON).  The requirements for carrying
```

### Expand RA

"RA" is used throughout (first at line 159) but never expanded. Please expand
"Registration Authority (RA)" on first use, perhaps in Section 3 alongside
CA/RA.
