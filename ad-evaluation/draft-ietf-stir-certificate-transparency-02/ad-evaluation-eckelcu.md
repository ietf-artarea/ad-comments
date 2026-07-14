# Charles Eckel, ART AD, AD evaluation: draft-ietf-stir-certificate-transparency-02 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-stir-certificate-transparency-02.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

### normative language

```
363	   must include all necessary intermediate certificates to validate the

379	   Logs must publish a list of accepted root certificates, which aligns

417	   Logs must produce an STH within the Maximum Merge Delay (MMD) to

507	   *  Key caching - Log public keys are static and should be loaded at

522	       transparency logs for new entries.  The Monitor must be

627	   Signed Certificate Timestamps (SCTs) should be verified by

634	   and monitors should track Telephone Number (TN) and Service Provider
```

Should each of these be MUST/SHOULD?
And in case of line 627, why not MUST?

### tighten language in security considerations

```
620	   The use of Certificate Transparency (CT) within the STIR ecosystem
621	   enhances accountability but also introduces operational and security
622	   risks that must be managed.  Trust in the system depends on the
623	   integrity of CT logs and therefore, logs should be operated by
624	   reputable entities and monitored to detect mis-issuance or
625	   inconsistent Signed Tree Heads (STHs).
642	   CT logs and Certification Authorities (CAs) should implement
```

What does "must be managed" imply and is there a way to verify that logs are operated by "reputable entities"? 

```
630	   keys to prevent forgery or replay.  Key rotation and distribution
631	   should be performed securely.
```

What is meant to be performed securely?

```
639	   and entities, implementers should consider privacy implications and
```

How can this be done?

## Comments

### Abstract, establishment of trust

```
22	   logs themselves.  The intent is for the establishment of a level of
23	   trust in the STI eco-system that depends on the verification of
24	   telephone numbers requiring and refusing to honor STI certificates
25	   that do not appear in a established log.  This effectively ...
```

I find this sentence difficult to parse.

s/numbers requiring/numbers by requiring

Or break the sentence in two, e.g.,

"The intent is to establish a level of trust within the STI ecosystem that relies on the verification of telephone numbers. This involves requiring and refusing to honor STI certificates that are not listed in an established log."

### Abstract, avoidance of issuance

```
29	   number resource.  The primary role of CT in the STI ecosystem is for
30	   verifiable trust in the avoidance of issuance of unauthorized
31	   duplicate telephone number level delegate certificates or provider
32	   level certificates.  This provides a robust auditable mechanism for
```

The phrase "avoidance of issuance of" is clunky, and if I understand correctly, CT does not prevent or avoid issuance; rather, it ensures that issuance is publicly detectable, which is what creates the "verifiable trust." How about something like the following:

"In the STI ecosystem, the primary role of CT is to provide verifiable trust by detecting the unauthorized issuance of duplicate telephone number level delegate certificates or provider level certificates."

### unclear who/what is meant by "its"

```
150	   system (DNS).  This document describes a conceptually similar
151	   framework that directly borrows concepts like transparency receipts
152	   in the form of SCTs and how they are used in certificates and its
153	   specific use as part of the larger STIR framework for call
154	   authentication.  This framework is defined for the specific use with
```

### certificate change

```
168	   issuance of STI certificates and certificate change that are intended
```

Is this supposed to be certificate chains?

### actor vs role vs actor role

```
177	   There is three primary actors in the certificate transparency
```

In the text that follows, all three variations are used. Use one consistently.

### interested third parties

```
223	   logs.  Note, in [RFC6962] it is possible for certificate holders to
224	   directly contribute their own certificate chains or interested third
225	   parties,
```

Should this instead read as follows:

"Note, in [RFC6962] it is possible for certificate holders and interested third parties to contribute certificate chains, ..."

### extra "in" and "that"

```
225	   parties, however because in stir eco-systems that generally consist
```

s/because in stir eco-systems that generally consist/because STIR ecosystems generally consist

### trust anchors

```
229	   authorized to participate as valid trust anchors.  It is required
230	   that each chain ends with a trust anchor that is accepted by the log
231	   which would include those authorized trust anchors or a subset of
232	   them.
```

I am not sure what this is saying. I believe it should be reworded.

### asking a log file?

```
239	   the logs, asking them regularly for all new entries, and can thus
```

s/asking/checking

## Nits

### global replace

```
s/eco-system/ecosystem
s/stir/STIR
s/pre-certificate/precertificate
```

### typos

```
201	   web PKI environments, but provides a specific framework designed for
```

s/provides/provide

```
25	   that do not appear in a established log.  This effectively ...
```

s/a established/an established

```
177	   There is three primary actors in the certificate transparency
```

s/There is three/There are three

### formatting issue

```
606	   The main differences are: - The expected certificate types are STI
607	   certificates as defined in [RFC8226] and [RFC9060], with TNAuthList
608	   extensions. - Submitters are limited to STI Certification Authorities
609	   and Subordinate Certification Authorities. - Monitoring and auditing
610	   are focused on detection of mis-issued telephone number or service
611	   provider codes (SPCs). - The client roles (e.g., VS, AS) interact
612	   with certificates and logs in ways specific to SIP call
613	   authentication.
```

It seems this was meant to be formatted as a list?
---