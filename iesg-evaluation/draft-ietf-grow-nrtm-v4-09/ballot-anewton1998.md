# Andy Newton, ART AD, comments for draft-ietf-grow-nrtm-v4-09 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-grow-nrtm-v4-09.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Thanks to the Reviewers

Thanks to Claudio Allocchio for the ARTART review.
And thanks to the authors and working group for addressing the points in his review.

## Comments

Overall, this is a well written document. I only have some non-blocking comments.

### Two database suggestions

314	   databases are published from one instance.  For example, a mirror
315	   server publishing NRTMv4 for RIPE and RIPE-NONAUTH, will generate two

Would "RIPE and RIPE-NONAUTH (two separate IRR databases)" make it clearer
to the reader that RIPE and RIPE-NOAUTH refer to separate databases?

### Non-normative RECOMMENDEDs

416	   ...  It is RECOMMENDED to
417	   modify objects in such a way that this change is evident to humans
418	   reading the object text, for example, by adding remark lines or
419	   comments.

Without a specific action to take, is this RECOMMENDED normative? Can the advice to add remarks or comments
be made THE action to take?

934	   It is RECOMMENDED for mirror clients to be flexible where possible
935	   and reasonable when applying their own validation rules to IRR
936	   objects retrieved from mirror servers.  For example, a route object

This is good advice, but it is unclear what action is to be taken to be flexible.
I think this should be a non-normative "recommended".

### About Once a Year

982	   It is RECOMMENDED that IRR Database operators rotate the signing key
983	   on their mirror server about once per year.  ....

The "about" leaves a lot of room for interpretation. Can a range be specified, such as
between 8 months and 16 months?

### Consider Media Types

715	      If the snapshot or delta file was compressed with GZIP, the
716	      filename MUST end in ".gz", ...

Has the working group considered using media types to describe the type of content in the files, instead of relying on file name suffixes?
That might offer some flexibility for switching to different compression types, etc..., in the future.


## Nits

### Representing or Storing

116	   The Internet Routing Registry (IRR) consists of several IRR
117	   Databases, each storing objects in the Routing Policy Specification
118	   Language (RPSL) [RFC2622].  ....

I know this is a nit, but I think the objects are "respresented using RPSL",
where storage could be done by any means... such as a denormalized SQL db.
