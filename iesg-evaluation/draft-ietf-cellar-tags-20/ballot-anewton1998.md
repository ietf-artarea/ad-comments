# Andy Newton, ART AD, comments for draft-ietf-cellar-tags-20 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-cellar-tags-20.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/


## Thanks to the Reviewers

I want to thank the many reviewers of this draft, particularly Sean Turner for his
ARTART review.

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

### UTF-8 and Problematic Code Points.

196	   Official TagName values MUST consist of UTF-8 capital letters,
197	   numbers and the underscore character '_'.

In addition to Roman's DISCUSS on capitalized UTF-8, should the tags be
limited to exclude the problematic code points as described in RFC 9839?

And from your Security Considerations sections:

1671	   Most of the time strings are kept as-is and don't pose a security
1672	   issue, apart from invalid UTF-8 values.  Implementations MUST
1673	   validate TagString inputs for UTF-8 correctness and reasonable length
1674	   before use, in accordance with the security considerations in
1675	   Section 10 of [RFC3629].

I think you have to apply RFC 9839 to make a statement that UTF-8 values
don't apply a security risk.

### Beginning Underscore

204	   It is RECOMMENDED that tag names start with the underscore character
205	   '_' for non official tags that are not meant to be added to the list
206	   of official tags.

Why is the RECOMMENDED? Can it be a MUST? If it is RECOMMENDED, what are the ramifications of not following the recommendation?

### TagString Formatting

215	   Multiple items SHOULD NOT be stored as a list in a single TagString.
216	   If there is more than one tag value with the same name to be stored,
217	   it is RECOMMENDED to use separate SimpleTags with that name for each
218	   value.

Can this be a MUST NOT? Why allow them to be stored as a list at all. And if this advice is not followed,
what happens? Is it that some software won't interoperate? If that is the case, I think you are better off
stating this as a MUST NOT.

220	   Preexisting files may have used multiple values in the same TagString
221	   but given there is no defined delimiters they cannot be easily split
222	   into multiple elements.  INSTRUMENTS (Section 4.4) and KEYWORDS
223	   (Section 4.6) tags allow using a comma as a separator.  However, it
224	   is RECOMMENDED to use separate SimpleTags with each containing a
225	   single instrument or keyword value, respectively.

Why are separate tags only RECOMMENDED? Can this be a MUST as well? If it is to remain as a RECOMMENDED,
what are the consequences of not following the recommendation?

## Comments

### Support Of Other DISCUSS Positions

I support Éric's DISCUSS on UTF-8 spaces. Should that be whitespace?

I support Gory's position on the "Official". IMHO, the doc is describing "registered" values, not "official" values.

And like Gory, I support Med's position on the specification required for DEs.
