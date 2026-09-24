# Charles Eckel, ART AD, IESG ballot: draft-ietf-scone-protocol-08 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-scone-protocol-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks to the authors and the rest of the working group for a well written document. 3GPP is adding support for SCONE in Release 20. It is great to have this moving to pubication well in advance of the Release 20 deadlines. 

## Comments

### what is required for a packet to be successfully processed

548	   Processing a SCONE packet involves reading the value from the Rate
549	   Signal field.  However, throughput advice MUST be ignored unless
550	   another packet from the same datagram is successfully processed.

What is required for another packet to be successfully processed? My assumption is that merely receiving another packet is not sufficient. At what point is a packet that is received considered to have been successfully processed?

