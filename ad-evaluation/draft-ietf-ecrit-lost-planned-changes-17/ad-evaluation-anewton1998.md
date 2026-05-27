# Andy Newton, ART AD, AD evaluation comments for draft-ietf-ecrit-lost-planned-changes-17 
CC @anewtion1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-ecrit-lost-planned-changes-17.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Comments

### Abstract

25	   ...  Additionally, this document provides a conventional XML
26	   schema for LoST, as a backwards compatible alternative to the RelaxNG
27	   schema in RFC5222.

The abstract needs to be clear that the XML Schema replaces the RelaxNG schema
and that it is not just an alternative. Additionally, IDNITS is pointing out that
the abstract doesn't explicitly state that this doc updates RFC5222... which is
something the IESG will definitely point out. I suggest:

    Additionally, this document updates RFC5222 by providing an XML
    Schema for LoST as a replacement for the RelaxNG schema in RFC5222.

### Replacement XML Schema

First, my understanding is that "XML Schema" is the formal name for the W3C standard.
The s should be capitalized.

Also:

329	   This schema is an alternative to The Relax NG schema in [RFC5222].
330	   Future extensions to LoST are expected to use this schema as the base
331	   for the extensions, rather than the Relax NG schema.  Existing
332	   extensions described using the Relax NG schema continue to be valid.

This needs to be reworded as the XML Schema is a replacement, not an alternative.

Has validation of this XSD been done?

### RFC5378 Check

IDNITs says:

  -- The document seems to lack a disclaimer for pre-RFC5378 work, but may
     have content which was first submitted before 10 November 2008.  If you
     have contacted all the original authors and they are all willing to grant
     the BCP78 rights to the IETF Trust, then this is fine, and you can ignore
     this comment.  If not, you may need to add the pre-RFC5378 disclaimer. 
     (See the Legal Provisions document at
     https://trustee.ietf.org/license-info for more information.)

Has there been an attempt to contact the authors? I know Ted and Hannes are still active in the IETF.
I don't know about Henning. And I, as one of the original authors, am willing to grant the BCP78
rights to the trust. :)

### <asOf> in the result

288	   'expires' attribute set to "NO-CACHE".  A server SHOULD NOT include
289	   <asOf> in the result if <asOf> was not requested or if it otherwise
290	   used the current time to formulate the response.  A client receiving

Does the SHOULD NOT apply to both parts of the
sentence? And can this be a MUST NOT. It is not clear to me the implications
of violating this SHOULD NOT.

### OpenAPI

Section 8 just plops the OpenAPI definition into the document without any
explanatory text. This section needs some text explaining what this definition
is for.

### Normative References

This document is missing normative references to U-NAPTR, XML Schema and OpenAPI.

### IANA Considerations

The IANA considerations needs to register the replacement XML Schema, and needs
to register lostPlannedChange1 XML namespace.
