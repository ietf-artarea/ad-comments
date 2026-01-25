# Orie Steele, ART AD, comments for draft-ietf-cellar-codec-16 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-cellar-codec-16.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

### First Come First Served

I wonder if this policy is correct here.
There is no expert review, are there issues with the registry being filled with incorrect information?
Would it not be better to use expert review for these registries, and have the mailing list available to review new entries?


```
2890	8.  Security Considerations
```

You note here that some security issues don't come from Matroska.
I've noticed a lot of normative and informative rerences to specifications which are not necessarily readily avaialble to the reader.

Its probably worth calling that out a bit more directly here.
Its impossible for me to understand the security issues associated with disregarding some of the normative guidance in this document, without reading those referenced specifications.

## Comments

### How unique?

```
242	   encoded data in its associated Clusters.  This CodecID is a unique
243	   registered identifier that represents the encoding stored within the
```

I assume this is not globally unique, but instead unique in some limited context?


### Non normative may?

```
244	   Track.  Certain encodings MAY also require some form of codec
245	   initialization to provide its decoder with context and technical
246	   metadata.
```

I don't understand how this MAY impacts interoperability here.
How is initialization related to the mapping?
Why does na implementer need to understand this initialization stuff at this point in the document?

Later:

```
330	   Each encoding supported for storage in Matroska MUST have a defined
331	   Initialization.  The Initialization MUST describe the storage of data
```

Is this the same initialization stuff?
Why is it not capitalized when introduced if that is the case?

### Why so many params for OPUS?

```
1241	3.4.32.  A_OPUS
```

This section has a lot more details than the others.
This raises the question of why the other sections don't have these details, and what normative guidance is missing in those sections, which is present in this one, for example regarding Channels and CodecDelay.


### buton

```
1653	   header consisting of the string "butonDVD" followed by the width and
```

I assume this spelling is intentional.


### BlockAddIDValue

```
1691	   Block type name: "Use BlockAddIDValue"
```

Is the "Use" here correct?

## Nits

### ID Nits

```
  == Missing Reference: 'Events' is mentioned on line 2254, but not defined
```

I assume this is from:

```
2254	   [Events]
2255	   Format: Marked, Start, End, Style, Name, MarginL, MarginR, MarginV, \
2256	   Effect, Text
```

Not sure how to fix this, I would leave that to the experts.