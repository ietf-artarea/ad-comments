# Orie Steele, ART AD, comments for draft-ietf-core-oscore-groupcomm-27 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-core-oscore-groupcomm-27.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

Thanks to Patrik Fältström for the ARTART review.
The review contains security related comments which I am not in a position to comment on.

### public key algorithm is fully described?

```
776	   If authentication credentials are CBOR Web Tokens (CWTs) or CWT
777	   Claims Sets (CCSs), the public key algorithm is fully described by a
778	   COSE key type and its "kty" and "crv" parameters.
```

https://www.iana.org/assignments/cose/cose.xhtml#elliptic-curves


Later:

```
897	      In case the other endpoint's public key has COSE Key Type "EC2"
898	      [RFC9053] (e.g., for the curves P-256, P-384, and P-521), then the
899	      public key is used as is.  In case the other endpoint's public key
900	      has COSE Key Type "OKP" [RFC9053], the procedure is described in
901	      Section 5 of [RFC7748].  In particular, if the public key is for
902	      X25519 or X448, it is used as is.  Otherwise, if the public key is
903	      for the curve Ed25519 or Ed448, it is first mapped to Montgomery
904	      coordinates (see Section 2.5.2).
```

X25519 is curve value 4, but Ed25519 is curve value 6, both are OKP (good).
However, P-256 is curve value 1, and supports many algorithms and is of key type EC2.

> This document defines these algorithms to be used with the curves P-256, P-384, P-521, X25519, and X448. Implementations MUST verify that the key type and curve are correct. 

https://www.rfc-editor.org/rfc/rfc9053.html#section-6.3.1-8

I don't understand what "fully described" means in this context.
A key type and curve do not fully describe a key agreement or signature algorithm in absence of additional information.

