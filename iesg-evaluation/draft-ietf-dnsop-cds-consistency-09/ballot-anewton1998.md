# Andy Newton, ART AD, comments for draft-ietf-dnsop-cds-consistency-09 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-dnsop-cds-consistency-09.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### BCP 14 Language

See the [IESG statement on BCP14 language](https://datatracker.ietf.org/doc/statement-iesg-statement-on-clarifying-the-use-of-bcp-14-key-words/).

Would these RECOMMENDS be better with explanations? Or if there is no further advice to give,
would making these non-normative be a good solution?

204	   ..  A configurable retry schedule with
205	   exponential back-off is RECOMMENDED (e.g., after 5, 10, 20, 40, ...
206	   minutes). ...

218	   ...  A
219	   schedule with exponential back-off is RECOMMENDED.

In this case, what happens if queries are not continued? Is this a lowercase "may" or
should an explanation be provided about what happens if an implementation does not follow the advice.

225	   in which case nothing needs to happen.  Queries MAY be continued
226	   across all nameservers for reporting purposes.

In the paragraph below, "(reachable) nameservers" in a MUST sentence appears to be softening the
requirement to the level of RECOMMENDED. If there is a firm requirement that nameservers be reachable,
then that should be stated clearly. "(reachable)" is again used on lines 244, 268, and 283.

234	   To retrieve a Child's CDS/CDNSKEY RRset for DNSSEC delegation trust
235	   maintenance, the Parental Agent, knowing both the Child zone name and
236	   its NS hostnames, MUST ascertain that queries are made against all
237	   (reachable) nameservers listed in the Child's delegation from the
238	   Parent, and ensure that each key referenced in any of the received
239	   answers is also referenced in all other received responses, or that
240	   responses consistently indicate a request for removal of the entire
241	   DS RRset ([RFC8078], Section 6).

I see that the paragraph at line 201 discusses reachability, but IMO it is still not clear
that an implementation MUST accomodate for it as consideration of reachability is a SHOULD:

201	   When a response cannot be obtained from a given nameserver, the
202	   Parental Agent SHOULD attempt to obtain it at a later time, before
203	   concluding that the nameserver is permanently unreachable and
204	   removing it from consideration.  ...

If reachability is implementation dependent, should that not be stated?

## Comments

## Nits

### Network Vantage Point

Maybe this is minor, but "network vantage point" is more specificly descriptive.

206	   ...  To sidestep localized routing issues, the Parental Agent
207	   MAY also attempt contacting the nameserver from another vantage
208	   point.
