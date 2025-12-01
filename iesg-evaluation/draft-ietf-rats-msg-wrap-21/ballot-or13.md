# Orie Steele, ART AD, comments for draft-ietf-rats-msg-wrap-21 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-rats-msg-wrap-21.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

### +jws

```
1152	   Name:  JSON Web Signature (JWS)
1153	   +suffix:  +jws
1154	   References:  [RFC7515]
1155	   Encoding Considerations:  binary; values are represented as a JSON
1156	      Object or as a series of base64url-encoded values each separated
1157	      from the next by a single period ('.') character.
```

Given that SD-JWT (https://datatracker.ietf.org/doc/rfc9901/) now exists, do you want to include support for "~" ?

Note, that without doing so, you could have json encoded sd-jwt values, that cannot be converted to compact serialization.

You already have this issue with JSON encoded JWS that cannot be converted to compact, when the "header" paramater is required.


## Comments

### Which JWS Serialization?

```
560	   A JSON CMW can be signed using JSON Web Signature (JWS) [RFC7515].  A
561	   signed-json-cmw is a JWS object with the following layout:

563	   signed-json-cmw = {
564	     "protected": text .b64u (text .json signed-json-cmw-protected-hdr)
565	     ? "header": text .b64u (text .json signed-json-cmw-unprotected-hdr)
566	     "payload": text .b64u (text .json json-cmw)
567	     "signature": text .b64u bytes
568	   }
```

https://datatracker.ietf.org/doc/html/rfc7515#section-7.2.1

Implication is that multiple signatures are not supported, and that some important information might be in "header" which cannot be protected by the signature.

... You cannot use "header" in compact serialization.

it would be clearer to provide CDDL for the exact serializations that are supported, for example:

```
general-jws-json / flattened-jws-json / compact-jws / compact-sd-jwt 
```


## Nits

### Use before definition

```
544	   cose.label = int / text
545	   cose.values = any
```

In CDDL where productions like this are used, I always prefer to read them before their usage... So I don't have to backtrack to understand what has just been said.


