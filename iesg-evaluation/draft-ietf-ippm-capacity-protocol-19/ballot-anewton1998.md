# Andy Newton, ART AD, comments for draft-ietf-ippm-capacity-protocol-19 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-ippm-capacity-protocol-19.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

As noted in https://www.ietf.org/blog/handling-iesg-ballot-positions/,
a DISCUSS ballot is just a request to have a discussion on the following topics.

Thanks for writing this document.

###  Optional Checksum

772	   All of the PDUs exchanged between the client and server support a
773	   header checksum that covers the various fields in the UDPST PDU
774	   (excluding the Payload Content of the Load PDU and, to be clear, also
775	   the IP- and UDP-header).  This checksum is intended for environments
776	   where UDP data integrity may be uncertain.  This includes situations
777	   where the standard UDP checksum is disabled or a nonstandard network
778	   API is in use (things typically done to improve performance on low-
779	   end devices).  The calculation is the same as the 16-bit one's
780	   complement Internet checksum used in the IPv4 packet header (see
781	   section 3.1 of [RFC0791]).

783	   If a PDU sender is populating the checkSum field, it SHALL do so
784	   after the PDU is built but prior to any authentication or encryption
785	   processing (i.e., all fields starting with authMode are zeroed).  The
786	   PDU receiver SHALL subsequently verify the PDU checksum whenever
787	   checksum processing has been configured.  Verification requires that
788	   all fields starting with authMode are zeroed prior to the checksum
789	   calculation used to verify the PDU.

791	   Because of its redundancy when authentication is being used, it is
792	   OPTIONAL for a PDU sender to utilize the checkSum field whenever the
793	   authDigest field is also utilized.  However, because authentication
794	   is not applicable to the Load PDU, the checkSum field SHALL be
795	   utilized by the sender whenever UDP data integrity may be uncertain
796	   (as outlined above).

It maybe that I do not understand this, but how is it known that a
checksum is optional? Will it be all zeros?

Additionally, what does a failure look like when the checksums do not
match? Would it make sense to place a value in the table of Section 11.3.5
indicating a checksum mismatch?

