# Orie Steele, ART AD, comments for draft-ietf-cellar-tags-18 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-cellar-tags-18.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

### Reduced version underspecified

```
225	   TagString fields defined in this document with dates MUST have the
226	   following format: "YYYY-MM-DD hh:mm:ss.mss" or a reduced version.
```

Suggest you provide ABNF for the reduced version, or provide format strings for all valid reduced versions.

I assume "YYYY-MM-DD hh" is a valid reduced version?

Having both ISO8601 and RFC3339 as informative references here is awkward.
Consider framing this "custom date format" as MUST be an RFC3339 date string, without the T ... etc.

### Digit grouping delimiters

```
240	   TagString fields that require a floating-point number MUST use the
241	   "." mark instead of the "," mark.  Only ASCII numbers "0" to "9" and
242	   the "." character MUST be used.  The "." separator represents the
243	   boundary between the integer value and the decimal parts.  If the
244	   string doesn't contain the "." separator, the value is an integer
245	   value.  Digit grouping delimiters MUST NOT be used.
```

What is a digit grouping delimiter?
I assume "," is a digit grouping delimiter, are there others?

Are negative integers allowed? Do you mean to specify whole numbers and positive decimal numbers instead?

### UI MUST?

```
247	   To display it differently for another locale, applications MUST
248	   support auto replacement on display.
```

How is this implemented?
I don't understand this normative requirement.
Consider making this informative / motivational for the number formats section.

### Legacy character handling

```
250	   In legacy media containers, it is possible that the "," character
251	   might have been used as a separator or that digit grouping delimiters
252	   might have been used.  A Matroska Reader SHOULD consider the
253	   following character handling to parse such legacy formats:

255	   *  if multiple instances of the same non-number character are found,
256	      they are be ignored,
257	   *  if only one "." character is found and no other non-number
258	      character is found, the "." is the integer-decimal separator,
259	   *  if only one "," character is found and no other non-number
260	      character is found, the "," is a digit grouping delimiter,
261	   *  any other non-number character is ignored.
```

What is a legacy media container? (citation please)

"SHOULD consider" ... what does this mean?

If these characters are possible to encounter, they out to be allowed in the specification, and recognized, if you are trying to specify a transformation here, give a name to each side of the transformation and describe how to handle any exceptions that might be encountered from malformed data.

This section needs some work.
I suggest you focus on describing the numbers that exist, and then recommend how to produce new numbers, only allowing for legacy formats as a backward compatibility feature.

I would avoid describing transformations, unless you also describe exception handling.
Is the inline replacement comment meant to imply that readers mutate the data to display it?

## Comments

### synthetic data

```
125	   *  ARTIST = "Pet Shop Boys"

127	      -  LEAD_PERFORMER = "Neil Tennant"

129	         o  DATE_STARTED = "1981-08"
```

Prefer to use synthetic data for examples.
In recent drafts, we have removed real artist names.

Same comment for the later section:

```
416	   *  ARTIST = "Daft Punk"

418	   *  TITLE = "Da Funk"

420	   *  TOTAL_PARTS = "2"
```

### Guidance to DEs?

```
181	   would be better for that.  It's hard to define what should be in and
182	   what doesn't make sense in a file; thus, each demand needs to balance
183	   if it makes sense to be carried over in a file for storage and/or
184	   sharing or if it doesn't belong there.
```

Is this section meant to be guidance to DEs?
Consider framing this as guidance to DEs.

Later:

```
186	   We also need an official list simply for developers to be able to
187	   display relevant information in their own design, if they choose to
188	   support a list of meta-information they should know which tag has the
189	   wanted meaning so that other apps could understand the same meaning.
```

This appears to be the value of maintaining a public registry, consider framing this as motivation for the establishment and maintenance of the registry, instead of motivation for tags.

Later:

```
1671	   Matroska Tag Names for binary data are to be allocated according to
1672	   the "Specification Required" policy [RFC8126].
```

See https://datatracker.ietf.org/doc/html/rfc8126#section-4.6

"""
This policy is the same as Expert Review, with the additional
requirement of a formal public specification.
"""

I would recommend organizing the guidance for designated experts into its own section.


### UTF-8 "letters"

```
195	   Official TagName values MUST consist of UTF-8 capital letters,
196	   numbers and the underscore character '_'.

198	   Official TagName values MUST NOT contain any space.

200	   Official TagName values MUST NOT start with the underscore character
201	   '_'; see Section 3.1.
```

ABNF might be helpful for this.


### Why not MUST?

```
214	   Multiple items SHOULD never be stored as a list in a single
215	   TagString.  If there is more than one tag value with the same name to
216	   be stored, then more than one SimpleTag SHOULD be used.
```

When can this suggestion be ignored?

Later:

```
218	   Due to preexisting files where these formatting rules were not
219	   explicit, they are usually presented as rules that SHOULD be applied
220	   when possible, rather than MUST be applied at all times.  It is
221	   RECOMMENDED to use strict formatting when writing new tag values.
```

It's enough to say that "for backward compatibility, multiple items SHOULD NOT...".

And again, for new tag values, why not MUST?

### Type UTF-8

```
824	       | SUBTITLE | UTF-8 | Sub Title of the entity.  This is     |
```

Are emoji allowed? what about control characters?

Is there a more specific way to describe this type?

Consider using https://datatracker.ietf.org/wg/precis/documents/ or https://datatracker.ietf.org/doc/draft-bray-unichars/ .

### MAY exceed max depth

```
1642	   memory of the host app by using very deep nesting.  An host app MAY
1643	   add some limits to the amount of nesting possible to avoid such
1644	   issues.
```

What does adding a limit mean here?

Is everything below that depth ignored?

Is it possible that adding much a limit could lead to other application failure issues?

### Why not must

```
1657	   The Name corresponds to the value stored in the TagName element.  The
1658	   Name SHOULD always be written in all capital letters and contain no
1659	   space as defined in Section 3.2,
```

Is this also to support backward compatibility?


## Nits

### in in

```
96	   section, the different high level parts of Matroska as defined in in
97	   Section 4.5 of [RFC9559] and EBML Master Elements as defined in in
```

### reads awk

```
178	   (Section 6.1).  This registry is not meant to have every possible
179	   information in a file.  Matroska files are not meant to become a
```