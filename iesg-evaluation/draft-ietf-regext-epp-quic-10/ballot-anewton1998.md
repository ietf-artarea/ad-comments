# Andy Newton, ART AD, comments for draft-ietf-regext-epp-quic-10 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-regext-epp-quic-10.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### MUST or must

389	      Batch-oriented processing (combining multiple EPP commands in a
390	      single data unit) is not permitted.  Each EPP data unit must
391	      contain a single EPP message.

Should this be a normative MUST?

### Server Requirement for Client Fall Back

407	8.1.  Clients Fall Back with Management of Multiple Transport

409	   If the establishment of an EoQ connection fails, clients MAY attempt
410	   to fall back to EPP over TCP as specified in [RFC5734], depending on
411	   local deployment and security policy.  It is up to clients to
412	   determine the mix of transports that best meets their business needs.

While it is up to the client to determine if fall back is necessary, what are the requirements on the server?
If a client falls back to EoT but the server doesn't have EoT, isn't that an interoperability issue?
I think this can be solved with the following addition:

    Servers MUST offer service over TCP (EoT [RFC5374]) for clients that fall back to TCP.


