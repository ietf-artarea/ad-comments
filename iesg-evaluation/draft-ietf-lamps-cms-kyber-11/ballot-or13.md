# Orie Steele, ART AD, comments for draft-ietf-lamps-cms-kyber-11 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-lamps-cms-kyber-11.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### ukm

```
221	      no reason to.  For maximum interoperability, recipients using ML-
222	      KEM SHOULD accept and process the ukm.  Recipients that do not
223	      support the ukm field SHOULD gracefully discontinue processing
224	      when the ukm field is present.
```

This is framed weirdly imo.
Failure to process ukm consistently will lead to different key material.

I might consider framing this as:

Recipients who do not understand ukm MUST ignore it, and not raise an error.
Recipients who understand ukm MUST process it in order to achieve interoperability.

I find the treatment of ukm here amusing given its cousin in JOSE:

https://datatracker.ietf.org/doc/html/rfc7518#section-4.6.1.2

### Why not MUST?

```
416	   and ciphertext.  Implementations SHOULD NOT use intermediate values
417	   directly for any purpose.
```

```
419	   Implementations SHOULD NOT reveal information about intermediate
420	   values or calculations, whether by timing or other "side channels",
421	   otherwise an opponent may be able to determine information about the
422	   keying data and/or the recipient's private key.  Although not all
```

Under which circumstances is a side channel useful for interop?

### Weird may

```
433	   Parties MAY gain assurance that implementations are correct through
434	   formal implementation validation, such as the NIST Cryptographic
435	   Module Validation Program (CMVP) [CMVP].
```

