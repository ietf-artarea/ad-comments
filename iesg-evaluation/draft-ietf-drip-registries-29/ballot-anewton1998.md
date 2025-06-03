# Andy Newton, ART AD, comments for draft-ietf-drip-registries-29 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-drip-registries-29.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### DNSSEC

369	   DNSSEC is strongly RECOMMENDED.  When a DIME decides to use DNSSEC
370	   they SHOULD define a framework for cryptographic algorithms and key
371	   management [RFC6841].  This may be influenced by frequency of
372	   updates, size of the zone, and policies.

Why is DNSSEC only RECOMMENDED? Why isn't this a MUST?

### DPS

761	   If DNSSEC is used, a DNSSEC Practice Statement SHOULD be developed
762	   and published.  It SHOULD explain how DNSSEC has been deployed and
763	   what security measures are in place.  [RFC6841] documents a Framework
764	   for DNSSEC Policies and DNSSEC Practice Statements.  A self-signed
765	   entity (i.e. an entity that self-signed it certificate as part of the
766	   HHIT RRType) MUST use DNSSEC.

Under what circumstances is it acceptable that a DPS not be used and
published when using DNSSEC? If there are none, this sounds like a MUST.

### SHOULD provide WHOIS

772	   the Extensible Provisioning Protocol (EPP) [STD69].  The registry
773	   SHOULD provide a lookup service such as WHOIS [RFC3912] or RDAP
774	   [STD95] to publish public information about registered domain names.

Considering that WHOIS uses an insecure transport, there is no means to find
the WHOIS servers for this space, and it has many other problems, it is probably
best that the IETF does not suggest its use. Can WHOIS be removed from this
recommendation?

Additionally, why is this a SHOULD? Can it be a MUST?

### Checking for Imposters

561	   For delegation requests relating to a country’s DET address space,
562	   the DE will liaise with that country’s CAA to verify these requests
563	   are genuine.  This will ensure delegations don’t go to impostors and
564	   the CAA is aware about what’s being done with its National Resources,
565	   ie the IPv6 addresses for its DET address space.

As liaising can just be exchanging emails with a stranger on the Internet,
can this be made more specific? Otherwise, there does not seem to be much assurance
that the delegation cannot go to an imposter. Can the DE be requested to
verify the identity of the requestor using common and reasonable methods?

I am also concerned that a person acting as a DE would be taking on non-trivial
amounts of liability if they are expected to reduce the possibility of delegation
to imposters. There are risks in accidentally accepting requests from imposters
and denying requests to authentic requestors. Is the DE expected to be a person
or a few persons acting in their individual capacity?

### Technical Checks

572	   The DE will have the discretion to perform minimal technical checks
573	   on delegations - for instance that there are at least two name
574	   servers that answer authoritatively, SPoF avoidance, etc - but not
575	   enforce these.

It is always helpful to be much specific about these checks, otherwise we
shouldn't expect that they will be done. Can a non-exhaustive list of checks
be specified?

Additionally, why is this at the discretion of the DE? Why shouldn't they
always do these checks? And for the sake of stability and usability of
this part of DNS, shouldn't the DE have the ability to enforce compliance
with these checks? While the DE will not perform ongoing checks, it seems
reasonable that delegations are viable initially.

### Changes to Delegations

555	   The DE will check delegation requests for DET address space that get
556	   submitted to IANA.  Since there is no control over who submits these
557	   delegation requests or the address space they refer to, a degree of
558	   checking is necessary.  The DE will liaise with IANA on the outcome
559	   of these checks.

If changes are needed after initial delegation, is the DE responsible for
verifying the change request? Would the DE perform the technical checks
again? Does the DE verify the identity of the requestor for a change request?

## Comments

### MAY store physical characteristics

374	   UAS specific information, such as physical characteristics, MAY also
375	   be stored in DNS but is out of scope for this document.

As there is no interoperability consideration for storing this info in DNS or not storing it in DNS, this should
be a non-normative MAY.

### ICAO

567	   Parts of the DET address space are allocated for experimental use.
568	   The DE is expected to process these delegation requests on a first-
569	   come, first-served basis.  They would not need engagement with ICAO
570	   or CAAs.

ICAO is not defined in the document.

## Nits

