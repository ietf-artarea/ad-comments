# Orie Steele, ART AD, comments for draft-ietf-drip-registries-29 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-drip-registries-29.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/


## Comments

I support Roman and Andy's DISCUSS.

### Use of Existing DNS Models

```
240	3.1.  Use of Existing DNS Models
```

Perhaps this section could be removed / reduced to a reference?


### Possible solutions

```
332	   Dynamic DRIP registration is another possible solution, for example
333	   when the operator of a UAS device registers its corresponding HHIT
334	   record and other resources before a flight and deletes them
335	   afterwards.  This may be feasible in controlled environments with
```

For a proposed standard, I would expect clearer guidance on when to choose each solution, not a survey of possible solutions.


### Out of scope, but in the the document

```
344	   others).  All of these are out of scope for this document.  The
345	   specifics for the UAS RID use case are detailed in the rest of
346	   document.
```

Probably the informative text could be drastically reduced, since the operational details of the existing normative dependencies are out of scope for this document.


### SHOULD not MUST

```
369	   DNSSEC is strongly RECOMMENDED.  When a DIME decides to use DNSSEC
370	   they SHOULD define a framework for cryptographic algorithms and key
371	   management [RFC6841].  This may be influenced by frequency of
372	   updates, size of the zone, and policies.
```

Why note MUST? When is it recommended to use DNSSEC without defining such a framework?
This is also a downref, does not appear to have been called out.


### Text Representation

```
407	   The data are represented in base64 [RFC4648] and may be divided into
408	   any number of white-space-separated substrings, down to single base64
409	   digits, which are concatenated to obtain the full object.  These
410	   substrings can span lines using the standard parenthesis.  Note that
411	   the data has internal subfields but these do not appear in the master
412	   file representation; only a single logical base64 string will appear.
```

I don't understand "substrings can span lines using the standard parenthesis".

It seems like this is just white space seperated base64 strings, which MUST be concatenated, before they can be decoded to the binary data.

This section seems repeated needlessly in:

```
470	5.2.1.  Text Representation
```

Consider refactoring to a reference.

### Consider and EDN example

```
416	   The data MAY, for display purposes only, be represented using the
417	   Extended Diagnostic Notation as defined in Appendix G of [RFC8610].
```

An ellided example could improve this section, especially since what immediately follows is CDDL not EDN.
You might also consider a reference to the appendix of this document.

### IANA Considerations

```
555	   The DE will check delegation requests for DET address space that get
556	   submitted to IANA.  Since there is no control over who submits these
557	   delegation requests or the address space they refer to, a degree of
558	   checking is necessary.  The DE will liaise with IANA on the outcome
559	   of these checks.
```

Will the DE requests and related discussions be conducted on a public mailing list?


```
577	   The DE will be expected to liaise with IANA to develop a DNSSEC
578	   Practice Statement for delegations in 3.0.0.1.0.2.ipv6.arpa. if/when
579	   there’s a demand for DNSSEC deployment for DRIP.
```

This feels like it might be better accomplished with specification required registration policy.


### ISO 3166-1 Numeric Nation Codes and RAAs

```
626	   The mapping between ISO 3166-1 Numeric Nation Codes and RAAs is
627	   specified as a CSV file on GitHub (https://github.com/ietf-wg-drip/
628	   draft-ietf-drip-registries/blob/main/iso3166-raa.csv).  Each Nation
```

I assume this github link will be removed in the future?

### Normative guidance in security considerations

```
764	   for DNSSEC Policies and DNSSEC Practice Statements.  A self-signed
765	   entity (i.e. an entity that self-signed it certificate as part of the
766	   HHIT RRType) MUST use DNSSEC.
```

This requirement should be called out in the body of the document.


### influence security SHOULD

```
776	   Decisions about DNS or registry best practices and other operational
777	   matters that influence security SHOULD be made by the CAA, ideally in
778	   consultation with local stakeholders.
```

I don't understand how to implement this should.
Is this establishing some relationship between the CAA and EPP operational guidance?
Consider referring to BCPs here, and framing this as a recommendation to deviate from BCPs only with the express support of the CAA, or similar framing.


### Section 7.5 of RFC9374 does not exist

```
795	   When DNSSEC is not in use, due to the length of the ORCHID hash
796	   selected for DETs (Section 7.5 of [RFC9374]), clients MUST "walk" the
```

I think you mean Section 3.5

### ORCHID Validation Procedures

```
795	   When DNSSEC is not in use, due to the length of the ORCHID hash
796	   selected for DETs (Section 7.5 of [RFC9374]), clients MUST "walk" the
797	   tree of certificates locating each certificate by performing DNS
798	   lookups of HHIT RRTypes for each DET verifying inclusion into the
799	   hierarchy.  The collection of these certificates (which provide both
800	   signature protection from the parent entity and the public key of the
801	   entity) is the only way without DNSSEC to prove valid registration.
802	   The data within the BRID RRType has no direct endorsement when not
803	   protected by DNSSEC.  The contents of the BRID RRType auth key,
804	   containing the Endorsements, SHOULD be validated, similiar to the
805	   certificates mentioned previously.

```

Requirements for clients should be introduced in the body of the document.
Faults in the validation procedure or issues with key compromise should be discussed in the security considerations.

Under which cases can "SHOULD be validated" be ignored, or be made mandatory?


### Security impact of signalling

```
823	   Optimally this requires that the UAS somehow signal the DIME that a
824	   flight using a Specific Session ID will soon be underway or complete.
825	   It may also be facilitated under UTM if the USS (which may or may not
826	   be a DIME) signals when a given operation using a Session ID goes
827	   active.
```

I don't follow why this is in the security considerations.

### Guidance to registry

```
772	   the Extensible Provisioning Protocol (EPP) [STD69].  The registry
773	   SHOULD provide a lookup service such as WHOIS [RFC3912] or RDAP
774	   [STD95] to publish public information about registered domain names.
```

Is this new guidance to registries to support DIME?

When can this SHOULD be ignored?

Guidance related to the core operation of the protocol should be in the body of the document.


## Nits

#### AAA expand of first use

```
157	   This document does not specify AAA mechanisms used by Private
```