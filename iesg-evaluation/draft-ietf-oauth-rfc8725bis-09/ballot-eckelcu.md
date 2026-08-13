# Charles Eckel, ART AD, IESG ballot: draft-ietf-oauth-rfc8725bis-09 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-oauth-rfc8725bis-09.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks to Valery Smyslov for the ARTART review and to the authors for addressing the points raised. 

## Comments

### Section 3.11, RECOMMENDED vs REQUIRED use of "typ"

681	   Explicit typing is RECOMMENDED for new uses of JWTs, because without
682	   it, mutually exclusive validation rules are harder to enforce and
683	   cross-JWT confusion becomes more likely.
 
Is there a specific reason the "typ" requirement is "RECOMMENDED" rather than "REQUIRED" for new uses of JWTs?