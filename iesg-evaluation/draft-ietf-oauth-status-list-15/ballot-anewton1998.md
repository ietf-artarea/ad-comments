# Andy Newton, ART AD, comments for draft-ietf-oauth-status-list-15 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-oauth-status-list-15.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Thanks to the Reviewers

Thanks to John Levine for the ARTART review.

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

Thanks for the work on this document. I have a few DISCUSS issues which I think are easily addressed.
All of my issues are around the use of SHOULD and RECOMMENDED.

### Status Label

956	   It is RECOMMENDED to use status for the label of the field that
957	   contains the Status CBOR structure.

Keeping in mind that I am not familiar with ISO mdoc, why is this RECOMMENDED? Will there be an interoperability failure
if an implementer does not follow this advice? Or is this just a common practice? If it is just a practice, can this be
a non-normative "recommended"?

### Status Type Values

1112	   This document creates a registry in Section 14.5 that includes the
1113	   most common Status Type values.  Applications SHOULD use registered
1114	   values for statuses if they have the correct semantics.  Additional
1115	   values may be defined for particular use cases.  Status Types
1116	   described by this document comprise:

Why is this a SHOULD and not a MUST? Is there some circumstance when type VALID is to be used when INVALID is more appropriate?

### Status List Request

1145	   The Status Provider SHOULD provide Status List Token on an endpoint
1146	   serving an HTTP GET request to the URI provided in the Referenced
1147	   Token, unless the Relying Party and the Status Provider have
1148	   alternative methods of distribution.

Can this be a MUST as well? If there is no other pre-arranged distribution method, would it be acceptable for the
status list to be available in any other method than HTTP GET?

1155	   The Relying Party SHOULD send the following Accept HTTP Header to
1156	   indicate the requested response type unless the Content-Type of
1157	   Status List Tokens in the respective ecosystem is known or the
1158	   Relying Party supports both formats:

1160	   *  "application/statuslist+jwt" for Status List Token in JWT format

1162	   *  "application/statuslist+cwt" for Status List Token in CWT format

1164	   If the Relying Party does not send an Accept Header, the response
1165	   type is assumed to be known implicitly or out-of-band.

Is this using something other than normal HTTP content negotiation? If not, I think it is better to
identify the media types for the status list formats and defer to how HTTP does content
negotiation.

### Security Guidance

1482	   A Status List Token in the JWT format SHOULD follow the security
1483	   considerations of [RFC7519] and the best current practices of
1484	   [RFC8725].

1486	   A Status List Token in the CWT format SHOULD follow the security
1487	   considerations of [RFC8392].

Why aren't these a MUST? Is there something in those considerations that would cause interoperability problems?

### Redirection

1557	   HTTP clients that follow 3xx (Redirection) class of status codes
1558	   SHOULD be aware of the possible dangers of redirects, such as
1559	   infinite redirection loops, since they can be used for denial of
1560	   service attacks on clients.  A client SHOULD detect and intervene in
1561	   infinite redirections.  Clients SHOULD apply the guidance for
1562	   redirects given in Section 15.4 of [RFC9110].

Why aren't these MUST? Is there a reasonable scenario in which a client is advised to be unaware of infinite redirection loops, etc...?


