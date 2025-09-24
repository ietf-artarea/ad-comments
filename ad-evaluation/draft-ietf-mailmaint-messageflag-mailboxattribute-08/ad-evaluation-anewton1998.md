# Andy Newton, ART AD, AD evaluation comments for draft-ietf-mailmaint-messageflag-mailboxattribute-08 
CC @anewtion1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-mailmaint-messageflag-mailboxattribute-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

Many thanks to Jim Fenton for the shepherd's writeup.

## Comments

### Expert Review

Have the Designated Experts for this IANA registry reviewed these
new entries?

### Early IANA Review

The shepherd has noted the following:

    The shepherd has some concern about the IANA considerations, specifically that
    the template shown in the IANA considerations does not align with the form of
    the registries being added to. It was noted that <a href="/doc/rfc5788/">RFC 5788</a>, which was the source
    of other entries in the registry, also doesnÕt align. Hopefully this can be
    resolved in interactions with IANA during the publication process.

Has IANA been approached about this issue? If it cannot be resolved with
the document as-is, that is best resolved now. IANA does stock their help
desk at the IETF with candies as an incentive to talk to them any time
about issues.

### Visibility

The use of the word "visibility" is incorrect. Visibility is about being
seen whereas the desired outcome here is to increase the user's awareness
of the message or somehow bring it to their attention. In practice this
may be accomplished via audio notifications.

Found in this paragraph:

237	   The $muted keyword provides a way for users to indicate they are not
238	   interested in future messages in a particular conversation thread.
239	   This enables automated processing of subsequent messages in that
240	   thread to reduce their visibility.

And this paragraph:

273	   When a new message arrives in a thread where this keyword is present,
274	   supporting servers MAY take actions to prioritize the message.  This
275	   could include ensuring it appears in the inbox regardless of
276	   filtering rules that might otherwise affect it, automatically adding
277	   the $notify keyword to ensure notifications, or applying other
278	   handling that increases its visibility.  The specific actions taken
279	   and whether they can be configured by the user depends on the
280	   implementation.

Another similar issue occurs here with the word "visually", though in
practical terms that is what will happen. Still, the word could be
dropped without loss of meaning to the sentence.

394	   This keyword is set by the server on the user's copy of vacation
395	   auto-replies, automated responses, or other system-generated messages
396	   sent on behalf of the user.  It allows clients to visually
397	   distinguish these messages from those directly composed and sent by
398	   the user.

There are other areas in this document that mention that a client should
"display" or somehow visually indicate certain things. While I am less
concerned about these, I think the document would be better by saying
client's should "distinguish" these messages from others for the reason
given. The advice on displaying check marks, etc... is still good and
should stay in the document, but it is only one way to implement making
the messages distinguishable from another.

For example:

529	   Supporting clients SHOULD display these messages with special visual
530	   treatment to draw user attention, such as highlighting, bolding, or
531	   placing them at the top of the message list, even if strict date
532	   sorting would place them elsewhere.

While I find it annoying, I know people with clients that make noises
when a new message is received.

## Nits

### Non-ASCII Characters

The nits checker (and the shepherd writeup) note that there are two
non-ASCII characters somewhere lurking in the doc. Can those be fixed?
