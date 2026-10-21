# Charles Eckel, ART AD, IESG ballot: draft-ietf-jose-deprecate-none-rsa15-07 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-jose-deprecate-none-rsa15-07.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks to Barry Leiba for the ARTART review and to the draft authors for addressing his comments.

## Comments

I support the DISCUSS by Mahesh on RFC 7519 Section 8.

### Section 5: requirement levels for library vs. app devs

```
197        Both of the algorithms listed above are deprecated for use in JOSE:
198        the "none" algorithm for JWS, and "RSA1_5" for JWE.  JOSE library
199        developers SHOULD deprecate support for these algorithms.
200        Application developers MUST disable support for these algorithms by
201        default.
```
Adding to Ketan’s comment: “by default” really describes library behavior, since applications get their defaults from the libraries they use. As written, an application that is never configured with either algorithm, but uses a library that accepts them, may not satisfy the MUST without code changes the developer can’t easily see. Consider making the default-off requirement apply to libraries (“MUST NOT enable … by default”). The application requirement would then be to enable them only explicitly.

