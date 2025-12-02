# Andy Newton, ART AD, comments for draft-ietf-opsawg-prefix-lengths-08 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-opsawg-prefix-lengths-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### Problematic UTF8

138	   prefixlen files are CSV (Comma Separated Values) files in UTF-8
139	   [RFC3629] text format; not HTML, richtext, or other formats. ...

RFC 9839 describes problematic UTF-8 code points which are likely inappropriate
for this specification. Scanning the code points for US-ASCII that are defined
in RFC 4180, it would appear that some of them do fall within the problematic set
if there is to be a straightforward translation of the US-ASCII to UTF-8.
Would it be appropriate to restrict the UTF-8 to non-problematic sets as
described in RFC 9839?

Also (more of a comment, not a discuss), the wording "not HTML, richtext, ..." is confusing, in my opinion. Those
are document formats not character encodings, and my first read left me questioning
what they had to do with UTF-8.

### Skipping Errors

237	   Upon encountering an erroneous entry in a prefixlen file, consumer
238	   implementations SHOULD skip that entry, log the error, and continue
239	   processing the remaining entries.

Under what circumstances is it ok for a consumer to continue processing an
entry it knows to be an error? If you think there are none, what about this proposed change:

>  Upon encountering an erroneous entry in a prefixlen file, consumer
>  implementations MUST skip that entry, and SHOULD log the error, and continue
>  processing the remaining entries.

### Transition From Remarks

298	   An approach to introduce a new RPSL attribute of type extref: for
299	   generic external references is described in
300	   [I-D.ymbk-opsawg-rpsl-extref].  With this extref approach a prefixlen
301	   can be referenced as follows:

303	             inetnum: 192.0.2.0/24 # example
304	             extref: Prefixlen https://example.com/prefixlen

The extref draft appears to have been expired for six months now. Are you sure
you want to reference a document that does not appear to be progressing.

306	   Until all producers of inetnum: objects, i.e., the RIRs, state that
307	   they have migrated to supporting a prefixlen: or extref: attribute,
308	   consumers looking at inetnum: objects to find prefixlen URLs MUST be
309	   able to consume the remarks:, prefixlen:, and extref: forms.

The extref draft is used in normative language here, but is listed as an
informative reference.

Also, I am confused by this transition strategy. If 2 of the RIRs switch
to prefixlen and 3 switch to extref, does that mean consumers can thus ignore
remarks?

Additionally, this appears to be a departure from RFC 9632, which states:

> This document allows, but discourages, an inetnum: to have
> both a geofeed remarks: attribute and a geofeed: attribute.

If we had to discourage the dual usage pattern from RFC 9092 with obsoletion in
RFC 9632, is it appropriate to have the dual usage pattern here?

### RDAP Remarks

607	   At the time of publishing this document, the registry data published
608	   by ARIN are not the same RPSL as that of the other registries (see
609	   [RFC7485] for a survey of the WHOIS Tower of Babel); therefore, when
610	   fetching from ARIN via FTP [RFC0959], WHOIS [RFC3912], the
611	   Registration Data Access Protocol (RDAP) [RFC9082], etc., the
612	   "NetRange" attribute/key must be treated as "inetnum", and the
613	   "Comment" attribute must be treated as "remarks".

The reference to RDAP is inappropropriate as it has neither NetRange nor Comment.
Additionally, the appropriate RDAP RFC would be RFC 9083 as that describes the
ip network object class, not RFC 9082. Regarding the NetRange key, it might also
be useful to refer to the CIDR0 extension.

## Comments

### Geolocation Use Case

110	   *  Geolocation: Getting the right prefix size for IPv6 geolocation is
111	      similarly hard.  If you aggregate too much, you throw together
112	      different clients in different locations, and if you aggregate too
113	      little, you fill up the geolocation database with unnecessary
114	      entries.

Does this imply that RFC 9632, from which this document borrows many concepts,
is inappropriate for IPv6 geolocation?

## Nits

### RDAP GeoFeeds

362	   On the other hand, RIRs are converging on RDAP support which includes
363	   geofeed data, see [I-D.ietf-regext-rdap-geofeed].  It is hoped that
364	   this will be extended, or generalized, to support prefixlen data.

This is now RFC 9877.
