# Andy Newton, ART AD, comments for draft-ietf-scim-cursor-pagination-08 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-scim-cursor-pagination-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### Opaque Cursors

179	   Cursor values are opaque; clients MUST not make assumptions about
180	   their structure.  When the client wants to retrieve another result

Thanks for putting this in the document. It needs to be stated. That said,
the normative use is "MUST NOT".

### Normative Language

I support Mohamed's comments on normative langue. But I do want to drill down
on some of it.

254	   generate an HTTP response with status code 400.  Since many
255	   pagination error conditions are not user recoverable, error messages
256	   SHOULD focus on communicating error details to the SCIM client
257	   developer.

This is probably best as a lower-case "should" as there are likely no interoperability
considerations for crafting the messages to non-developers.

While the error may be useful to a developer, I assume users are the first line
of debugging. IMHO, this should say something like:

>  should focus on communicating technical details relevant to diagnosing the
>  error condition.

### Sorting

287	   If sorting is implemented as described Section 3.4.2.3 of [RFC7644],
288	   then cursor-paged results SHOULD be sorted.

What interoperability problems arise if the results are not sorted? And why would
a server not return a sorted response if it has implemented sorting? If there are
interoperability concerns when a sorted response is not returned, they should be
stated. If there are none, then this is better written without normative
language. Perhaps:

> Clients may indicate a sorted response however servers may return a response
> that is not sorted according to server policy.

### Confidentiality

539	   *  The system SHOULD handle error scenarios gracefully, while not
540	      exposing sensitive data.  For instance, if an actor attempts to

I am not a security expert, but isn't this better as a MUST? Such as:

> The system MUST handle error scenarios that would otherwise result in the
> unintended disclosure of sensitive data.

### Resource Exhaustion

589	   *  Cursor mechanisms must be designed in a manner that avoids any
590	      additional consumption of service provider resources with the
591	      initiation of new &cursor requests.

An informative reference to technical advice for implementers would be helpful here,
if one is available.


