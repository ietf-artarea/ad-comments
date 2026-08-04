# Andy Newton, ART AD, comments for draft-ietf-stir-certificates-shortlived-06 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-stir-certificates-shortlived-06.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks for this very well-written document.

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### SHOULD or MUST

Nothing major... just a simple question.

303	   ...  Operators SHOULD renew
304	   certificates in advance of expiry with enough lead time to absorb CA
305	   latency and transient failures, recognizing that the shorter the
306	   certificate lifetime, the tighter that renewal margin becomes.

Wouldn't failing to renew the certificates before they expire cause an interoperability issue?
If so, would it be reasonable that this is a MUST instead of a SHOULD?

## Comments

## Nits

298	6.  Ooperational Considerations

Misspelling.
