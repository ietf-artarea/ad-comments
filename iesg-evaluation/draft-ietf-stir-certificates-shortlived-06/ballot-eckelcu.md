# Charles Eckel, ART AD, IESG ballot: draft-ietf-stir-certificates-shortlived-06 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-stir-certificates-shortlived-06.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Thanks to the Reviewers

Thanks to the author and working group for a very clear and well written document. Thanks as well to Ben Campell, for the helpful shepherd's write-up.

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### normative language in operational considerations

303	   operationally critical to call signing.  Operators SHOULD renew
304	   certificates in advance of expiry with enough lead time to absorb CA
305	   latency and transient failures, recognizing that the shorter the
306	   certificate lifetime, the tighter that renewal margin becomes.
307	   Operators should stagger renewals and apply backoff on failure rather
308	   than retry aggressively against a busy CA, and the ACME STAR
309	   mechanism [RFC8739] can remove the client from the synchronous
310	   acquisition path by pre-issuing renewed certificates.  Useful signals

I support Andy's DISCUSS on the "SHOULD" in line 303.

My concern is with the "should" in 307. I believe that for consistency with the "SHOULD" in 303, it should be "MUST", or "SHOULD" if there are circumstances in which this should not be done. However, both of these could be viewed as operational considerations rather than actual protocol requirements. As they appear only in the operational considerations section, it is probably better that both be rephrased as strongly encouraged practices rather than as normative requirements. Let's DISCUSS.