# Andy Newton, ART AD, comments for draft-ietf-dnsop-ds-automation-08 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-dnsop-ds-automation-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Thanks to the Reviewer(s)

Thanks to Jiankang Yao for the ARTART review.

## Thanks to the Authors

Thanks to the authors for writing this document. I am aware this topic has been under discussion in both the IETF and SSAC.
This document does a good job describing the best practice for DS automation in a multi-facetted ecosystem where values
for this information can exist in many places under many areas of authority.

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### BCP 14 Language

Given Roman's ballot position, I think this document should be reviewed for BCP 14 language usage.
There are many places where a SHOULD might be a MUST, or where a SHOULD might be a "should".

The IESG has published guidance on this which can be found here:
https://datatracker.ietf.org/doc/statement-iesg-statement-on-clarifying-the-use-of-bcp-14-key-words/

I will go through some below.

#### 5-15 Minutes

240	   2.  Parent-side entities (such as registries) SHOULD reduce a DS
241	       record set's TTL to a value between 5–15 minutes when a new set
242	       of records is published, and restore the normal TTL value at a
243	       later occasion (but not before the previous DS RRset's TTL has
244	       expired).

Why isn't this a MUST? It is a SHOULD for both behaviors (the 5-15 minute TTL) and the restoration of the TTL.
At the very least, it seems the restoration of the "normal" TTL value is a MUST. However, why isn't the 5-15 minute value a MUST?
Otherwise an operator can set it to 5 years justified with "because I just wanted it that way".
If the SHOULD is to remain, isn't there a reasonable upper boundary behavior such as not being greater than the normal TTL value?

Also, is "normal TTL value" the previous TTL value? If not, what does that mean?

#### Both CDNSKEY and CDS

246	   3.  DNS operators SHOULD publish both CDNSKEY and CDS records, and
247	       follow best practice for the choice of hash digest type
248	       [DS-IANA].

Section 4.2.3 does a good job of explaining why both CDNSKEY and CDS are needed, so it seems the justification here is a MUST.
In other words, if you want to interoperate, the operator MUST do this otherwise there is likely to be a problem.

#### 5.1 Recommendations

389	   1.  For certain DS updates (see analysis (Section 5.2)) and for DS
390	       deactivation, relevant points of contact known to the parent-side
391	       entity (registry or registrar) SHOULD be notified.

393	   2.  For error conditions, the child DNS operator and the domain's
394	       technical contact (if applicable) SHOULD be notified first.  The
395	       registrant SHOULD NOT be notified unless the problem persists for
396	       a prolonged amount of time (e.g., three days).

398	   3.  Child DNS operators SHOULD be notified of errors using a report
399	       query [RFC9567] to the agent domain as described in Section 4 of
400	       [RFC9859].  Notifications to humans (domain holder) will be
401	       performed in accordance with the communication preferences
402	       established with the parent-side entity.  The same condition
403	       SHOULD NOT be reported unnecessarily frequently to the same
404	       recipient.

406	   4.  In the RRR model, registries performing DS automation SHOULD
407	       inform the registrar of any DS record changes via the EPP Change
408	       Poll Extension [RFC8590] or a similar channel.

410	   5.  The currently active DS configuration SHOULD be made accessible
411	       to the registrant (or their designated party) through the
412	       customer portal available for domain management.  The DS update
413	       history MAY be made available in the same way.

These seem to be a mixture of policy recommendations and good technical practices.
If reporting is not required for interoperation, these should probably all be lower case "should".

If reporting is required for proper DS automation, then at least some of this is a MUST.

#### DS update requests

659	   2.  DS update requests SHOULD be executed immediately after
660	       verification of their authenticity, regardless of whether they
661	       are received in-band or via an out-of-band channel.

For proper DS automation, shouldn't this be a MUST? If not immediately, then as soon as possible. Or is it ok for an operator to wait 24 hours?

#### SHOULD NOT initialize

675	   5.  In the RRR model, a registry SHOULD NOT automatically initialize
676	       DS records when it is known that the registrar does not provide a
677	       way for the domain holder to later disable DNSSEC.  If the
678	       registrar has declared that it performs automated DS maintenance,
679	       the registry SHOULD publish the registrar's [RFC9859]
680	       notification endpoint (if applicable) and refrain from registry-
681	       side DS automation.

Under what conditions are violating these SHOULD NOT/SHOULD acceptable?
If there are conditions for doing so, the document should attempt to describe those conditions. Otherwise, aren't these MUST NOT and MUST?

## Comments

### EPP Advertising

309	   ...  When using the Extensible
310	   Provisioning Protocol (EPP) [RFC5730], the domain <info> command
311	   described in Section 2.1.1.2 of [RFC9803] is available for
312	   advertising the server's TTL policy.

The use of the word "advertising" makes me read this as information being provided to the public.
However, EPP does not operate that way. I think should be reworded to say EPP can be used to make known to the registrar the acceptable values used by the registry.

### RDAP TTLs

410	   5.  The currently active DS configuration SHOULD be made accessible
411	       to the registrant (or their designated party) through the
412	       customer portal available for domain management.  The DS update
413	       history MAY be made available in the same way.

https://datatracker.ietf.org/doc/draft-ietf-regext-rdap-ttl-extension/ is also a good way to make the currently active TTL values available to the registrant or their designated party.


