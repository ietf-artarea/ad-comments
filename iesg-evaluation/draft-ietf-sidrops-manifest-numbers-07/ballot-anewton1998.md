# Andy Newton, ART AD, comments for draft-ietf-sidrops-manifest-numbers-07 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-sidrops-manifest-numbers-07.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/


Thanks for the work on this document.

## Comments

### Concur with Éric and Gorry

I have the same comment here as Éric and Gorry. Could the SHOULD NOT on 163 be a MUST NOT?
Could the SHOULD on 166 be a MUST?

163	   have no purpose.  To avoid this outcome, CAs SHOULD NOT use new
164	   filenames for manifests except in situations where such a change is
165	   necessary to address the invalidity problem described in this
166	   document.  Similarly, an RP SHOULD alert its operators when a

### Unnecessarily Normative

While this advice is good, is the SHOULD on line 205 specific enough to use 2119 language?
In my opinion, the lower-cased version is appropriate as the advice is too generic.

204	   invalidity scenario.  RPs that encounter other permanent invalidity
205	   scenarios SHOULD also consider how those can be addressed such that
206	   the scenario does not require the relevant CA or TA to perform a key
207	   rollover operation.  For example, in the event that an RP recognises

