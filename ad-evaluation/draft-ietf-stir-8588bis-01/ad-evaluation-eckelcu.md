# Charles Eckel, ART AD, AD evaluation: draft-ietf-stir-8588bis-01 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-stir-8588bis-01.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Comments

### confusing use of "should"

```
140	   The second claim is a unique origination identifier that should be
141	   used by the service provider to identify different sources of
142	   telephone calls to support a traceback mechanism that can be used for
143	   enforcement and identification of a source of illegitimate calls.
```
The use of "should" in line 140 seems a bit strange. I do not believe this is meant to be interpreted as a normative "SHOULD", in which case I suggest replacing with "can".

## Nits

### extra character in title

```
8	   Personal Ass[ertion Token (PaSSporT) Extension for Signature-based
```
- s/Ass[ertion/Assertion

### missing word in section 12

```
290	   ATIS standards process only retains the most version of a published
```
- s/most version/most recent version

### copy/paste errors within reference

```
327	   [RFC8226]  Peterson, J. and S. Turner, "Secure Telephone Identity
328	              Credentials: Certificates", RFC 8588,
329	              DOI 10.17487/RFC8588, February 2018,
330	              <https://www.rfc-editor.org/info/rfc8226>.
```
- s/RFC 8588/RFC 8226
- s/RFC8558/RFC8226
