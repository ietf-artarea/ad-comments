# Andy Newton, ART AD, comments for draft-ietf-pim-gaap-20 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-pim-gaap-20.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Thanks to the Reviewers

Thanks to Murray Kucherawy for the ARTART review.

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

All of my DISCUSSes come from Murray Kucherawy's ARTART review, and I
did not seem them addressed so I am raising this DISCUSS.

### Type Value

The Claim message type of 0 is reserved and 1 is defined in this document.
The type appears to be a 4-bit value. Are the other types reserved?
Is there suppose to be an IANA registry for them?

237	   At this time, there is a single message called the Claim message with
238	   type value 1.  Type value of 0 is reserved.  Claim messages are sent
239	   to the GAAP Group Address (see Section 2), a well-known multicast
240	   address allocated by IANA (see Section 9), distinct from the
241	   addresses GAAP allocates for applications.  The Claim message is sent
242	   in a UDP checksummed packet where the source port is ephemeral and
243	   chosen by the sender and the destination port is a well-known port
244	   allocated by IANA.  GAAP can work behind NAT and firewall devices as
245	   long as the GAAP destination port is permitted through filters.

247	     0                   1                   2                   3
248	     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
249	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
250	    |Type=1 |              Reserved                 | Record Count  |
251	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
252	    |                       0xAAAAAAAA Marker                       |
253	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
254	    |                  IPv4 Multicast Group Address                 | \
255	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+  \
256	    |                                                               |    R
257	    |                        IPv6 Multicast                         |    e
258	    |                         Group Address                         |    c
259	    |                                                               |    o
260	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+    r
261	    |                          Timestamp                            |    d
262	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+   /
263	    |                          Group Name ...                       |  /
264	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ /
265	    |                             ...                               |/
266	    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

### MUST in IANA Considerations 1

This block in the IANA considerations section contains BCP14 language.

See the IESG statement on BCP14 language:
https://datatracker.ietf.org/doc/statement-iesg-statement-on-clarifying-the-use-of-bcp-14-key-words/

In this case, the normative language are instructions to implementers
and not to IANA, so this statement should go in a place in the doc that
is more likely to be read by implementers.

875	   IANA will create one multicast address from the IPv4 Internetwork
876	   Control Block 224.0.1.x [RFC5771] and one multicast address from the
877	   IPv6 Variable Scope Multicast Addresses Block FF0X::TBD for the
878	   operation of the GAAP protocol.  The registry description field
879	   should indicate "GAAP".  GAAP control messages sent to these
880	   addresses are intended to reach all GAAP nodes within an
881	   administrative domain rather than being confined to a single link;
882	   consistent with that, the IPv4 address comes from the Internetwork
883	   Control Block rather than the Local Network Control Block, and
884	   implementations MUST use an admin-local or organization-local IPv6
885	   scope (not link-local scope) when selecting the scope value X for the
886	   IPv6 address, so that control messages can be forwarded beyond a
887	   single link when the deployment requires it.

### MUST in IANA Considerations 2

It is unclear to me to whom this MUST applies. Does it apply to IANA?
Does it apply to the RFC Editor? Regardless, it should not be in the IANA
considerations section.

891	   IANA will create two multicast address ranges for the GAAP protocol
892	   to allocate application-use addresses from.  For IPv4, a /10 block in
893	   a new registry range is requested.  The size follows from the hash-
894	   based allocation model in Section 6: a larger host portion within the
895	   block, combined with the up to 4 candidate addresses per group name
896	   (see "Acceptable Group Hash List" in Section 2), keeps collisions
897	   infrequent enough that a GAAP node rarely needs to fall back past its
898	   first candidate address.  As the draft has previously noted, because
899	   a /10 is nonetheless a large portion of the IPv4 multicast space,
900	   this size warrants specific attention from IETF and IANA before
901	   allocation, and the WG welcomes further discussion of the appropriate
902	   block size, including analysis of collision probability at expected
903	   deployment scales.  For IPv6, a /32 block in a new registry range is
904	   being requested, sized to match the 32-bit Group ID used directly in
905	   the hash-based derivation in Section 6; the larger IPv6 multicast
906	   address space makes collision probability far less of a concern than
907	   for IPv4.  This allocation MUST come from the Dynamic Multicast Group
908	   IDs registry defined in
909	   [I-D.ietf-pim-updt-ipv6-dyn-mcast-addr-grp-id], and publication of
910	   this document as an RFC is dependent on that registry existing; see
911	   the Normative References.

913	           Registry Name: GAAP IPv4 Allocation Range
914	           Registration Procedure: IETF Review

916	           Registry Name: GAAP IPv6 Allocation Range
917	           Registration Procedure: IETF Review

919	   For IPv6 multicast addresses, the GAAP application allocation range
920	   should be in the new "Dynamic Multicast Group IDs" registry requested
921	   by [I-D.ietf-pim-updt-ipv6-dyn-mcast-addr-grp-id].  This new registry
922	   requests the division of the 32-bit group ID range 0xA0000000 through
923	   0xAFFFFFFF.  The GAAP allocation range should come out of this 32-bit
924	   range.

