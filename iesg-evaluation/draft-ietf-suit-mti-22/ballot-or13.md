# Orie Steele, ART AD, comments for draft-ietf-suit-mti-22 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-suit-mti-22.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

Thanks to Barry Leiba for the ARTART review.

### OPTIONAL to MANDATORY?

```
492	   As time progresses, algorithm profiles may loose their MANDATORY
493	   status.  Then, their status will become either OPTIONAL or NOT
494	   RECOMMENDED for new implementations.  Likewise, a profile may be
495	   transitioned from OPTIONAL to NOT RECOMMENDED.  Since it may be
496	   impossible to update certain parts of the IoT device firmware in the
497	   field, such as first stage bootloaders, support for all relevant
498	   algorithms will almost always be required by authoring tools.
```

I wonder if its worth stating explicitly that suites marked OPTIONAL or NOT RECOMMENDED MUST NOT be transitions to MANDATORY.
Just for the sake of clarity to the DEs.


### Why no number assignment for the suite?

```
503	6.1.  Profile: suit-sha256-hmac-a128kw-a128ctr

505	   *  Profile: suit-sha256-hmac-a128kw-a128ctr

507	   *  Status: MANDATORY

509	   *  Digest: -16

511	   *  Auth: 5

513	   *  Key Exchange: -3

515	   *  Encryption: -65534

517	   *  Descriptor Array: [-16, 5, -3, -65534]

519	   *  Reference: Section 3.1 of THIS_DOCUMENT
```

Given the suite builds on COSE, I was expecting to see a number assigned to the suite.
Given that the registration policy is standards action, there does not seem to be a challenge in requesting the assignment of a new number.

