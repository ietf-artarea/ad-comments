# Andy Newton, ART AD, comments for draft-ietf-ntp-roughtime-17 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-ntp-roughtime-17.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Thanks to the Reviewers

Thanks to John Levine for the ARTART review.

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### ARTART Review

Noting John Levine's comment on [-17](https://datatracker.ietf.org/doc/review-ietf-ntp-roughtime-17-artart-telechat-levine-2026-02-23/)

> None of the changes from -15 to -17 change my review.  It's still ready with issues.

From my reading of the mail archives, none of John's concerns were addressed.
Specific to his review of [-15](https://datatracker.ietf.org/doc/review-ietf-ntp-roughtime-15-artart-lc-levine-2026-01-08/):

> far from others. But I don't understand how clients "without any idea of what
> time it is" set the time. I'm guessing that if they get a set of sufficiently
> close replies, it uses some average of them, but the discussion on section 6
> only talks about a client that already has a time, not one that doesn't.

How does this work? Should this document limit the applicability of the protocol to clients that have other means to acquire time?

Additionally:

> For example, in 5.1 "A request ... SHOULD include the tag SRV. Other tags SHOULD
> be ignored by the server. ... The size of the request message SHOULD be at least
> 1024 bytes when the UDP transport mode is used. To attain this size the ZZZZ tag
> SHOULD be added to the message." 
> 
> Why would you omit SRV? Why wouldn't the server ignore other tags? When would a
> shorter message be OK? Why wouldn't you use the ZZZZ tag? Some of these might
> have explanations, others might better be MUST or not use 2116 words.

I think John is right here. These probably should be MUST. This document should be reviewed for use of MUST where SHOULD hase been used.

### What is the experiment?

The intended status of this document is Experimental, but it is not clear to me what the experiment is about.
Should this document be Informational?

This document also sets up several IANA registries, one of which defines a range of values for "Experimental use".
Isn't this entire protocol an experiment? 
