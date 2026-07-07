# Andy Newton, ART AD, comments for draft-ietf-acme-device-attest-07 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-acme-device-attest-07.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

My DISCUSSes all center on BCP14 language. I also support Roman's DISUCSS.

### MUST consult

420	      specific account key.  The Server MUST consult format-specific
421	      documentation to determine which construction applies and MUST
422	      verify accordingly.  Attestation formats whose signing procedure

How does a server consult documentation? If this is about conforming to
another specification, maybe:

    The server MUST conform to the specification of a given format and MUST
    verify the attestation accordingly.

Hopefully I got the gist of that correct.

### SHOULD be aware

635	   Implementers operating ACME Clients SHOULD be aware that the
636	   attestation format selected may expose more device state than is
637	   necessary to satisfy the server's authorization policy.  Where
638	   multiple attestation formats are available, Clients SHOULD prefer
639	   formats that minimize the set of disclosed attributes.

I am not sure the SHOULD on line 635 is normative and to be uppercase.

For the SHOULD on line 638, is there a realistic reason a client would not prefer these formats?
If not, can this be a MUST?

### Implementers operating

718	   Implementers operating servers SHOULD store account-to-device
719	   bindings using the minimum fidelity necessary for authorization
720	   decisions.  Where the operational requirement is only to confirm that
721	   a given device is authorized to request certificates, it may be
722	   sufficient to store a hash or other one-way transformation of the
723	   device identifier rather than the identifier itself.  Implementers
724	   should also define and enforce retention limits on historical
725	   account-to-certificate linkage records.

This advice appears to be addressing operators and not implementations.
Would it be better to say "Implementations SHOULD store"?

Also, why isn't this a MUST? Is there a realistic reason for not doing this? And if so, can it be stated?

### SHOULD work through

729	   Implementers considering whether to include permanent-identifier or
730	   hardware-module in CSRs and issued certificates SHOULD work through
731	   the following questions before enabling these identifiers:

Can this be a MUST as well? What reason would somebody have for not following these best practices?


