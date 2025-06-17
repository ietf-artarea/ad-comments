# Orie Steele, ART AD, comments for draft-ietf-scim-device-model-14 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-scim-device-model-14.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

### Normative reference to expired ID indirectly

```
2499	   [JSONSChema]
2500	              Wright, A., Ed., Andrews, H. A., Ed., Hutton, B., Ed., and
2501	              G. Dennis, "JSON Schema- A Media Type for Describing JSON
2502	              Documents", December 2022,
2503	              <https://json-schema.org/draft/2020-12/json-schema-core>.
```

The URL referenced is hosting:

https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-01


## Comments

### clientToken

Is this an identifier? are emoji's allowed?
Perhaps this is obvious to SCIM experts, but I wondered if this was a JWT or a "client id", similar to what we seein OAuth.

```
412	   clientToken

414	   This attribute type string contains a token that the client will use
415	   to authenticate itself.  Each token may be a string up to 500
416	   characters in length.  It is not mutable, read-only, generated if no
417	   certificateInfo object is provisioned, case sensitive and returned by
418	   default if it exists.  The SCIM server should expect that client
419	   tokens will be shared by the SCIM client with other components within
420	   the client's infrastructure.
```

Later in the table:

```
463	    | clientToken     | F     |F  | T     | R       | N      | None   |
```

Implies that this is not returned?


### Why not must?

```
476	   Note that either clientToken and certificateInfo are used for the
477	   authentication of the application.  If certificateInfo is NOT present
478	   when an endpointApp is object created, then the server SHOULD return
479	   a clientToken.  Otherwise, if the server accepts the certificateInfo
```

### Why not JWK?

```
829	   bootstrapKey

831	   A string value representing an Elliptic-Curve Diffie-Hellman (ECDH)
832	   public key.  The base64 encoded lengths for P-256, P-384, and P-521
833	   are 80, 96, and 120 characters.  This attribute is required, case-
834	   sensitive, mutable, and returned by default.
```

I assume these are expanded public keys, with or without the 04 prefix?
No need to support agility / PQ crypto here?
JWK also supports x5t, x5c, etc...
I assume the key is encoded like this to enable it to be easily pasted into some existing protocol slot.

