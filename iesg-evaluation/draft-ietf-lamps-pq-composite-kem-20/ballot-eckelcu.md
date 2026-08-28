# Charles Eckel, ART AD, IESG ballot: draft-ietf-lamps-pq-composite-kem-20 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-lamps-pq-composite-kem-20.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks to Russ Housley for the helpful shepherd write and to the authors and working group for a well-written and important document.

## Comments

### shared secret vs. shared secret key

```
357	   *  Encaps(pk) -> (ss, ct): A probabilistic encapsulation algorithm,
358	      which takes as input a public key pk and outputs a ciphertext ct
359	      and shared secret key ss.  Note: this specification uses Encaps()
360	      to conform to [FIPS.203], while [RFC9180] uses Encap().

362	   *  Decaps(sk, ct) -> ss: A decapsulation algorithm, which takes as
363	      input a secret key sk and ciphertext ct and outputs a shared
364	      secret ss.  Different KEM algorithms differ in how they handle
```

I suspect "shared secret key ss" in line 360 should be changed to "shared secret ss" to align with lines 363-364.

### References

+1 to Ketan Talaulikar's point that RFC 5912 is used normatively in the ASN.1 module but is absent from the reference sections, as is [X509ASN1].


## Nits

### Expand KDF on first use

```
1554	   SHA3-256 is used as the KDF for all Composite ML-KEM algorithms.
```

I believe this the first use of KDF in this draft. It would be helpful to the reader to expand it, or add it to section 1.1.

