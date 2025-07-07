# Orie Steele, ART AD, comments for draft-ietf-lamps-cms-ml-dsa-05 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-lamps-cms-ml-dsa-05.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### Context not used?

```
244	   ML-DSA has a context string input that can be used to ensure that
245	   different signatures are generated for different application
246	   contexts.  When using ML-DSA as described in this document, the
247	   context string is not used.
```

I think you mean that the default context is used, which is empty per Section 5.2 of FIPS 204;

"By default, the context is the empty string, though applications may specify the use of a non-empty context string."

### Why not MUST?

```
266	      of the ML-DSA parameter set.  Verifiers MAY reject a signature if
267	      the signer's choice of digest algorithm does not meet the security
268	      requirements of their choice of ML-DSA parameter set.  Table 1
269	      shows appropriate SHA-2 and SHA-3 digest algorithms for each
270	      parameter set.
```

Seems weird for a verifier to accept such a signature.
