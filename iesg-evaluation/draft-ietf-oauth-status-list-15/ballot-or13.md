# Orie Steele, ART AD, comments for draft-ietf-oauth-status-list-15 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-oauth-status-list-15.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

### Not really out of scope....

```
1233	   As this is out of scope for this document, this validation is not
1234	   described here, but is expected to be done according to the format of
1235	   the Referenced Token.
```

This is not as clear as it could be.

Is it acceptable to perform any HTTP dereferencing in the case the referenced token is invalid?

Perhaps something to the effect of "regardless of the validation procedures for the referenced token, if validation fails, no http operations must be performed".

The current framing feels like its inviting implementers to make network requests which leak metadata, for tokens that are already considered invalid.

```
1285	       index is out of bounds of the Status List, no statement about the
1286	       status of the Referenced Token can be made and the Referenced
1287	       Token SHOULD be rejected.
```

This makes validation of the referenced token in scope... also... this SHOULD seems like a bad idea.
Why not MUST?... What does it mean to accept a token about which not statement of status can be made?


## Comments

### Public?

```
216	   Status Provider, who serves the Status List Token on a public,
217	   resolvable endpoint.  The Relying Party or the Holder may fetch the
```

Perhaps you mean simply accessible to the verifier? 
I'm not sure if public precludes .internal, or other non public internet resources.

### SD-JWT

```
827	   SD-JWT-based Verifiable Credentials (Section 3.2.2.2 of [SD-JWT.VC])
```

Is there a reason that SD-JWT VC is mentioned throughout this document instead of SD-JWT by itself?

### Why not MUST?

```
1113	   most common Status Type values.  Applications SHOULD use registered
1114	   values for statuses if they have the correct semantics.  Additional
```

Under which circumstances, can this SHOULD be ignored? 
Which use cases would encourage a different value from one in the registry to be used with the exact same semantics?


### Which .well-known

```
1387	   The Issuer MAY link to the Status List Aggregation URI in metadata
1388	   that can be provided by different means like .well-known metadata as
1389	   is used commonly in OAuth and OpenID Connect, or within Issuer
1390	   certificates or trust lists (such as VICAL as defined in Annex C of
```

It would be better to explicitly name the .well-known URIs than to refer to them like this.
The current normative requirement is ambiguous.


### One time use reference tokens

```
1704	   To avoid privacy risks of colluding Relying Parties, it is
1705	   RECOMMENDED that Issuers provide the ability to issue batches of one-
1706	   time-use Referenced Tokens, enabling Holders to use in a single
1707	   interaction with a Relying Party before discarding.  See Section 13.2
```

Is the index of and URL of the status information allowed to be the same for these single use tokens?

```
1723	   interacted with the same Holder.  It is therefore recommended to use
1724	   Status Lists for Referenced Token formats that have similar
1725	   unlinkability properties.
```

I don't undertand what "similar unlinkability properties" means.

### APPLICATION_SPECIFIC

Are there really 0 references to provide for these application specific registrations?
Are they in use today? or anticipated to be be used ever?
Are the reserved for experimentation, or reservered because of existing deployments?

## Nits

### Media type point of contact

```
2349	   *  Person & email address to contact for further information: Paul
2350	      Bastian, paul.bastian@posteo.de
```

While this has been common, I think it is better to direct the point of contact for media types reserved by a working group to the working group list itself.



