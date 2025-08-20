# Andy Newton, ART AD, AD evaluation comments for draft-ietf-mailmaint-imap-uidbatches-17 
CC @anewtion1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-mailmaint-imap-uidbatches-17.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

Thanks to Ken for the Shepherd's writeup.

This document is clear and well written. Though I am barely familiar with IMAP,
I can easily conceive how this extension would be implemented based on this
document. There are also no major areas of concern, in my opinion. Thanks to
the author for writing this document.

## Comments

### Excessively is Subjective

196	   ...  The client MUST
197	   NOT excessively re-run UIDBATCHES while the same mailbox remains
198	   selected.

This is good advice, but unless "excessively" can be defined there is nothing to help an implementer know
falls into this category of something they must not do. Is there more concrete advice that can be given?

### Client Requirements

261	3.1.3.2.  Client Requirements

263	   The server MUST support batch sizes of 500 messages or larger.  This
264	   minimum size prevents clients from misusing the extension to
265	   effectively reconstruct sequence numbers while still allowing
266	   reasonable batch operations.

268	   The server MUST respond with NO and a response code TOOFEW if the
269	   client uses a batch size smaller than the minimum allowed by the
270	   server:

272	   S: A302 NO [TOOFEW] Minimum batch size is 500

This section is title "Client Requirements" but has normative language only
for the server.

Additionally, should there be a requirement that clients MUST accept batches
smaller than they requested? Or is the advice in 3.1.3.3.4 adequate?

### Appendix Worthy Text

501	3.3.  Similarity to PARTIAL Extension

503	   The PARTIAL extension in [RFC9394] provides a different way for the
504	   client to split its commands into batches by using paged SEARCH and
505	   FETCH.

507	   The intention of the UIDBATCHES command is to let the client pre-
508	   determine message batches of a desired size.

510	   This makes it easier for the client to share implementation between
511	   servers regardless of their support of PARTIAL.  And additionally,
512	   because the client can issue a corresponding UID SEARCH command to
513	   servers that do not implement UIDBATCHES, the client can use similar
514	   batching implementations for servers that support UIDBATCHES and
515	   those that do not.

I always appreciate drafts that discuss design criteria and intentions,
however this does not appear to be normative. Would it be better in an appendix?

### Repeated Information

530	3.5.  Interaction with UIDONLY Extension

532	   As noted above, the UIDBATCHES extension allows for clients to create
533	   UID ranges for message batches even when the connection operates in
534	   UIDONLY mode which otherwise doesn't allow for using message sequence
535	   numbers.

Is this section necessary if the information is "noted above"? There doesn't
seem to be any normative text in it.

### Operational Considerations

577	   This document defines an optimization that can both reduce the amount
578	   of work performed by the server, as well as the amount of data
579	   returned to the client.  Use of this extension is likely to cause the
580	   server and the client to use less memory than when the extension is
581	   not used.  However, as this is going to be new code in both the
582	   client and the server, rigorous testing of such code is required in
583	   order to avoid the introduction of new implementation bugs.

This sounds like operational considerations and not security considerations.
It is good to have in the document, but should it be in an "Operational Considerations"
section.

## Nits

### Rerun

185	   To prevent server overload, the client MUST NOT re-run UIDBATCHES
186	   unless at least one of the following conditions is met:

Maybe "re-run" should be "resend". Or is "re-run" an IMAP term of art?

### Can or May

200	   The client can keep track of the number of EXPUNGE or VANISHED
201	   messages and re-run UIDBATCHES if many messages are deleted.

203	   As new messages arrive into the mailbox, the client should add these
204	   to a new message batch (starting at UID 215296 in the above example).
205	   Once N/2 or more new messages have been added to the mailbox, the
206	   client can ask for updated batches by re-running the UIDBATCHES
207	   command.

IMHO, this is better if "can" is changed to "may".

### At least

455	   The server MUST at least support returning UID ranges spanning
456	   100,000 messages.  See Section 3.1.5 for details on this limit.

IMHO, "at least" is not needed here.

### Blank line
464	   C: A302 UIDBATCHES 2000
465	   S: A302 NO [TOOMANY] Too many messages in mailbox
466	   The client should know what the message count in the mailbox is, and
467	   if the message count exceeds 100,000 it may choose to always request
468	   batch ranges as discussed in Section 3.1.5 instead of requesting all
469	   batches.

You might want a blank line between the example and the text.

### At Most

525	   Additionally, since servers MAY limit the number of UIDs returned in
526	   response to UIDBATCHES, it is reasonable to assume that they would at
527	   most return N UIDs where N is the limit the server announced as its
528	   MESSAGELIMIT.

IMHO, "at most" is not needed.
