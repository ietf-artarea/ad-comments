# Orie Steele, ART AD, comments for draft-ietf-cellar-codec-16 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-cellar-codec-16.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

## Reference Classification Analysis

I used AI for this section of my review, none the less, please consider the analysis carefully.

I've reviewed each reference flagged by idnits. Below is a case-by-case analysis of the severity of issues when normative references are not freely available.

### RFC Downrefs (Informational RFCs used normatively)

**RFC 6386 (VP8 Data Format and Decoding Guide) - Informational RFC**
- **Classification**: Currently normative
- **Usage**: Referenced for VP8 codec mapping (line 908)
- **Assessment**: This is a downref (normative reference to Informational RFC). The document MUST reference VP8 to define the codec mapping, so this appears correctly classified as normative from a functional perspective. However, this requires IESG approval per RFC 3967/BCP 97. 
- **Severity: Medium** - The working group should make a recommendation to the responsible AD regarding whether this reference shall be added to the downref registry. The reference itself is appropriate.

**RFC 9043 (FFV1 Video Coding Format) - Informational RFC**
- **Classification**: Currently normative  
- **Usage**: Referenced for FFV1 codec mapping (lines 600, 605)
- **Assessment**: Another downref. FFV1 is an important preservation codec, and the document MUST reference it to define the mapping. 
- **Severity: Medium** - The working group should make a recommendation to the responsible AD regarding whether this reference shall be added to the downref registry. The reference is functionally correct.

### Non-RFC Normative References - Freely Available

The following are correctly classified as normative and are freely available (no issue):

- **ALAC** - Freely available, used normatively for codec mapping (line 1147)
- **AV1** - Freely available, used normatively for codec mapping (line 518)
- **AV1-ISOBMFF** - Freely available, used for AV1 container binding
- **BITMAPINFOHEADER** - Freely available Microsoft documentation
- **Dirac** - Freely available, used for Dirac codec mapping
- **DolbyVision-ISOBMFF** - Freely available (though requires registration)
- **JPEG** - Freely available via ITU-T/W3C, used normatively (line 625)
- **OggKate** - Freely available
- **QTFF** - Freely available Apple documentation
- **SSA** - Freely available subtitle format spec
- **Theora** - Freely available
- **TRUEHD** - Freely available
- **TTA** - Freely available
- **USF** - Freely available
- **VobSub** - Freely available
- **VORBIS** - Freely available
- **VP9** - Freely available
- **WAVEFORMATEX** - Freely available Microsoft documentation
- **WAVPACK** - Freely available
- **WebVTT** - Freely available W3C spec

**Assessment**: All correctly classified as normative. No issues.

### Non-RFC Normative References - NOT Freely Available

**IEEE Standards (4 references):**

1. **IEEE.1857-10** - "IEEE Standard for Third Generation Video Coding"
   - **Availability**: Available for purchase from IEEE
   - **Usage**: Referenced for AVS3 codec mapping (line 563)
   - **Severity: HIGH** - This is a normative reference required to implement AVS3 support. Implementers cannot comply without purchasing the standard. This significantly impacts implementability and reviewability.

2. **IEEE.1857-3** - "IEEE Standard for a System of Advanced Audio and Video Coding"
   - **Availability**: Available for purchase from IEEE
   - **Usage**: Referenced for AVS2 codec mapping (line 574)
   - **Severity: HIGH** - Same issue as above. Required for AVS2 implementation.

3. **IEEE.1857-4** - "IEEE Standard for Second-Generation IEEE 1857 Video Coding"
   - **Availability**: Available for purchase from IEEE
   - **Usage**: Referenced for CAVS codec mapping (line 552)
   - **Severity: HIGH** - Required for CAVS implementation.

4. **IEEE.754** - "IEEE Standard for Binary Floating-Point Arithmetic"
   - **Availability**: Available for purchase from IEEE
   - **Usage**: Referenced for floating-point data representation (line 1385)
   - **Severity: MEDIUM** - IEEE 754 is widely implemented and understood, but still requires purchase. However, the core concepts are well-documented elsewhere. This could potentially be moved to informative if the document doesn't mandate specific IEEE 754 conformance requirements.

**ISO Standards (6 references):**

1. **ISO.11172-2** - MPEG-1 Video
   - **Availability**: Available for purchase from ISO
   - **Usage**: Referenced for MPEG-1 video codec mapping
   - **Severity: HIGH** - Required for MPEG-1 implementation.

2. **ISO.11172-3** - MPEG-1 Audio
   - **Availability**: Available for purchase from ISO
   - **Usage**: Referenced for MPEG-1 audio codec mapping
   - **Severity: HIGH** - Required for MPEG-1 audio implementation.

3. **ISO.13818-2** - MPEG-2 Video
   - **Availability**: Available for purchase from ISO
   - **Usage**: Referenced for MPEG-2 video codec mapping
   - **Severity: HIGH** - Required for MPEG-2 implementation.

4. **ISO.14496-15** - Carriage of NAL unit structured video in ISO base media file format
   - **Availability**: Available for purchase from ISO
   - **Usage**: Referenced for H.264/AVC and HEVC mappings
   - **Severity: HIGH** - Critical for AVC/HEVC implementation.

5. **ISO.14496-2** - MPEG-4 Visual
   - **Availability**: Available for purchase from ISO
   - **Usage**: Referenced for MPEG-4 video codec mapping
   - **Severity: HIGH** - Required for MPEG-4 implementation.

6. **ISO.14496-3** - MPEG-4 Audio
   - **Availability**: Available for purchase from ISO
   - **Usage**: Referenced for MPEG-4 audio codec mapping
   - **Severity: HIGH** - Required for MPEG-4 audio implementation.

**ITU-T Standards (1 reference):**

1. **JPEG2000** (ITU-T T.800)
   - **Availability**: Available for purchase from ITU-T
   - **Usage**: Referenced for JPEG2000 codec mapping (line 614)
   - **Severity: HIGH** - Required for JPEG2000 implementation.

### Summary and Recommendations

**Critical Issues (HIGH severity):**
- 10 normative references require purchase (4 IEEE, 6 ISO, 1 ITU-T)
- These are essential for implementing the codec mappings defined in this document
- This creates a significant barrier to implementation and review
- The IESG Statement on Normative and Informative References (https://www.ietf.org/about/groups/iesg/statements/normative-informative-references/) states: "Normative references to documents that are not freely available can create serious problems for the community"

**Recommendations:**
1. For each non-freely-available normative reference, the document should explicitly state in the Security Considerations section that implementers must obtain these standards to fully understand security implications.
2. Consider whether any of these could be moved to informative if the document only needs to reference them for context rather than requiring conformance.
3. Document in the Security Considerations section that security analysis is incomplete without access to the referenced standards.
4. For the downrefs (RFC 6386, RFC 9043), the working group should make a recommendation to the responsible AD regarding whether these references shall be added to the downref registry.


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