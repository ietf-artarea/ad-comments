# Orie Steele, ART AD, comments for draft-ietf-oauth-selective-disclosure-jwt-19 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-oauth-selective-disclosure-jwt-19.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

### Requirements for "aud" in SD-JWT and KB-JWT

```
869	      -  aud: REQUIRED.  The intended receiver of the Key Binding JWT.
870	         How the value is represented is up to the protocol used and out
871	         of scope of this specification.
```

Is there any need to comment on array vs single audience here, or guidance for profiles regarding this?

```
1987	   *  aud (Audience), although issuers MAY allow individual entries in
1988	      the array to be selectively disclosable
```

Consider addressing the security considerations for "aud" in one place, and commenting on the guidance for profiles of both SD-JWT and SD-JWT+KBs.

Is it safe to allow selective disclosure within the audience claim?
Does the safeness vary between SD-JWT and KB-JWT?

### Requirement for typ in Key Binding JWT

Due to the nature of typ in Key Binding JWT, there does not appear to be a way to signal that specific audience values are expected for a profile, or that other specific header parameters are REQUIRED.
For example, it would not be possible to signal that a key binding token was expected to use x5c, x5t, or x5u, because kb+jwt is mandatory.

Consider adjusting the typ parameter to MUST be kbt+jwt, when the existensibility model of JWT is not needed.

I like the idea of knowing that "kb+jwt" will not contain additional header parameters or validity claims, but I'm not sure that it's reasonable to prevent profiles from reusing it.

TLDR: mandating a specific value for typ in KB-JWT seems against the explicit typing guidance for JWTs.



## Comments

Thanks to Henry S. Thompson for the ARTART review.

I agree there is some possible confusion regarding string, JSON text, and UTF-8, consider the language from STD90:


```
A JSON text is a serialized value.
...
A JSON value MUST be an object, array, number, or string, or one of
...
JSON text exchanged between systems that are not part of a closed
ecosystem MUST be encoded using UTF-8 [RFC3629].
```

Consider clarifying the definition of Disclosure:

```
243	   Disclosure:  A base64url-encoded string of a JSON array that contains
244	      a salt, a claim name (present when the claim is a name/value pair
245	      and absent when the claim is an array element), and a claim value.
246	      The Disclosure is used to calculate a digest for the respective
247	      claim.  The term Disclosure refers to the whole base64url-encoded
248	      string.
```

Perhaps:

```
Disclosure:  A base64url-encoded JSON array as described in Section 5 of RFC8259 that contains
  a salt, a claim name (present when the claim is a name/value pair
  and absent when the claim is an array element), and a claim value.
  The term Disclosure refers to the whole base64url-encoded string.
  The Disclosure is used to calculate a digest for the respective claim.  
```

Note that Section 2 of RFC7515 uses the term octet sequence, which seems extraneous if you are citing STD90.

For clarity:

- Diclosures when present inside JSON objects and arrays are quoted as described in Section 7 of RFC8259.
- Disclosures when present in SD-JWT are not quoted, because the SD-JWT is not itself a JSON text.

Also, regarding:

```
     d) In the second media type registration in 12.2
           "represented as a JSON Object" ->
           'represented as UTF-8 encoded "JSON text" as defined in [RFC8259]'
```

I don't agree with this, because JSON text includes things that are not objects, see:

https://datatracker.ietf.org/doc/html/rfc8259#section-2

I think the intention is to align with https://datatracker.ietf.org/doc/html/rfc7515#section-3.2

Perhaps:

```
*  Encoding considerations: binary; application/sd-jwt+json values
   are represented as a JSON object as described in Section 3.2 of [RFC7515].
```

### 9.9.  Forwarding Credentials

disclosure, I contributed text to this section:

https://github.com/oauth-wg/oauth-selective-disclosure-jwt/pull/354

What appears as a decoy to the holder, can be conveyed as information to a verifier, right?

In other words, when forwarding in a chain, out of band disclosures could allow a downstream verifier to learn more than an upstream one?

Consider if this is worth mentioning in:

```
2277	10.4.  Decoy Digests
```

### use of encryption

```
2270	   To encrypt the SD-JWT when transmitted over an insecure channel,
2271	   implementers MAY use JSON Web Encryption (JWE) [RFC7516] by nesting
2272	   the SD-JWT as the plaintext payload of a JWE.  Especially, when an
2273	   SD-JWT is transmitted via a URL and information may be stored/cached
2274	   in the browser or end up in web server logs, the SD-JWT SHOULD be
2275	   encrypted using JWE.
```

I assume this applies to both SD-JWT and SD-JWT+KBs, could be clearer

### Signing with symmetric keys

Perhaps its obvious that symmetric signing is not appropriate for either SD-JWT or KBs.
Similarly encryption algorithms are not appropriate for SD-JWT or KB-JWT.

But this requirement is currently first introduced in security considerations:

```
1833	   signature algorithm.  Any of the JWS asymmetric digital signature
1834	   algorithms registered in [IANA.JWS.Algorithms] that meet the security
1835	   requirements described in the last paragraph of Section 5.2 of
1836	   [RFC7515] can be used, including post-quantum algorithms, when they
1837	   are ready.
```

And to be clear, you mean post quantum assymetric digital signature algorithms, right?

### Flattened JSON Serialization & General JSON Serialization

```
1633	   This section describes an alternative format for SD-JWTs and SD-
1634	   JWT+KBs using the JWS JSON Serialization from [RFC7515].  Supporting
1635	   this format is OPTIONAL.
```

To be clear, both of the JSON Serialization formats are to be considered optional, right?

### Processed SD-JWT Payload

```
1531	   processed SD-JWT payload, can be made available to the application to
1532	   be used for its intended purpose.
```

Consider capitalzing this term, and adding it to the terminology section.

## Nits

### header is outside of the payload.

```
857	   payload MUST contain the following elements:

859	   *  in the JOSE header,
```

There is also a terminology mismatch between "JOSE header" and "JWT payload", I would recommend JWT protected header to be clearer.

### adversary or verifier

```
753	   An Issuer MAY add additional digests to the SD-JWT payload that are
754	   not associated with any claim.  The purpose of such "decoy" digests
755	   is to make it more difficult for an adversary to see the original
756	   number of claims or array elements contained in the SD-JWT.  Decoy
757	   digests MAY be added both to the _sd array for objects as well as in
758	   arrays.
```

Consider repeating the framing you have later:

```
1806	   *Selective Disclosure:* An adversary in the role of the Verifier
```

### Double negative

```
398	   and the last separating tilde character MUST NOT be omitted.
```

Prefer MUST be present.

### JSON data structure

```
15	   This specification defines a mechanism for the selective disclosure
16	   of individual elements of a JSON data structure used as the payload
17	   of a JSON Web Signature (JWS).  The primary use case is the selective
18	   disclosure of JSON Web Token (JWT) claims.
```

Perhaps JSON object is a better choice here, the common case will be an object, I'm not sure about arrays.

### VC_DATA_v2.0 no longer in CR

Verifiable Credentials Data Model v2.0
W3C Recommendation 15 May 2025

