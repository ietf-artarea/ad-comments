# Orie Steele, ART AD, comments for draft-ietf-lamps-rfc5272bis-08 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-lamps-rfc5272bis-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

## Comments


### The identifier

```
632	   3.  The input for the key derivation algorithm is a concatenation of
633	       the identifier (encoded as UTF8) and the shared-secret.
```

I'm not sure which identifier is being referred to here.

### Why not MUST?

```
All certification requests encoded into a single PKIData SHOULD be
for the same identity.  RAs that batch process (see Section 6.17) are
expected to place the PKI Requests received into the cmsSequence of a
PKIData.
```

Is this for compatibility with existing implementations, or to allow for batching  / performance optimizations?
Are the security implications for requesting multiple identities in a single PKIData?


### Something you know?

```
1673	   different degrees of security and reliability.  Most are familiar
1674	   with a bank's request to provide your mother's maiden name as a form
1675	   of identity proof.  The reasoning behind requiring a proof-of-
```

Is this really a good example for knowledge factor these days?
Consider something to prevent folks from assumign security questions are a good solution to knowledge factors.

"The quality of a knowledge factor depends on how difficult it is for an unauthorized person to discover the information."




## Nits

