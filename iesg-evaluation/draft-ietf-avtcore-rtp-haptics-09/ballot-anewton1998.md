# Andy Newton, ART AD, comments for draft-ietf-avtcore-rtp-haptics-09 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-avtcore-rtp-haptics-09.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Many thanks to Bron Gondwana for the ARTART review.

## Comments

Thanks for the work on this document.

### IANA Considerations

Like Ketan and Eric, I think the IANA considerations should be moved into the
IANA considerations section.

### Textual

196	   ...  Both
197	   quantized and descriptive data can be encoded in a human-readable
198	   exchange format based on JSON (.hjif) ...

Just my opinion after squinting at unreadable JSON thousands of times,
but I think the contrast between hjif and hmpg is that hjif is "text-based"
or "text-encoded" rather than being binary encoded.
