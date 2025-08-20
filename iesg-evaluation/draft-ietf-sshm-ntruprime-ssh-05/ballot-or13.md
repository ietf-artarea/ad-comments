# Orie Steele, ART AD, comments for draft-ietf-sshm-ntruprime-ssh-05 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-sshm-ntruprime-ssh-05.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### SSH_DISCONNECT_KEY_EXCHANGE_FAILED: Why not MUST?

I'm sure this has been discussed by the WG, but:

```
134	   keys Q_C or Q_S are not the expected lengths.  An abort for these
135	   purposes is defined as a disconnect (SSH_MSG_DISCONNECT) of the
136	   session and SHOULD use the SSH_DISCONNECT_KEY_EXCHANGE_FAILED reason
137	   for the message, see section 11.1 (Disconnection Message) of
138	   [RFC4253].  No further validation is required beyond what is
```

Which other reason codes are appropriate for this?

### Ok to Implement?

```
193	   Since sntrup761x25519-sha512 is expected to offer no reduction of
194	   security compared to curve25519-sha256, it is recommended that it is
195	   used and preferred whenever curve25519-sha256 is used today, when the
196	   extra communication size and computational requirements are
197	   acceptable.
```

```
213	   IANA is requested to add a new "Method Name" of
214	   "sntrup761x25519-sha512" to the "Key Exchange Method Names" registry
215	   for Secure Shell (SSH) Protocol Parameters [IANA-KEX] with a
216	   "reference" field to this RFC and the "OK to implement" field of
217	   "SHOULD".
```

The security considerations recommends "sntrup761x25519-sha512" over "curve25519-sha256" but the IANA guidance for both algorithms is "SHOULD".

I've seen discussion of this topic on the lists.

Per https://www.rfc-editor.org/rfc/rfc9142.html#section-3.1.3-4

```
Table 8 lists algorithms as "SHOULD" where implementations may be more efficient or widely deployed. The items listed as "MAY" in Table 8 are potentially less efficient.
```

...


```
Methods that are newer or considered to be stronger usually require more device resources than many administrators and/or developers need are to be allowed ("MAY"). (Eventually, some of these methods could be moved by consensus to "SHOULD" to increase interoperability and security.) Methods that are not "weak" and have implementation consensus are encouraged ("SHOULD"). There needs to be at least one consensus method promoted to a status of mandatory to implement (MTI). This should help to provide continued interoperability even with the loss of one of the now disallowed MTI methods.
```

If the working group believes that both methods are equally widely deployed and equally efficient, SHOULD seems correct to me.

I don't see how a WG can conclude that a PQ/T hybrid will be more widely deployed or more efficient than one of its traditional algorithm components, but I am not an expert on SSH.

I'd advise the WG to make this a "MAY", and to tackle clarifying the guidance this registry is trying to provide in a separate document.

I'm not recommending MAY for any reason other than I had to read RFC 9142 to understand what "Ok to implement" means.

The arguments raised regarding PQ migration and harvest now decrypt later are important.

However, I do not believe they justify reading a column in a registry differently for hybrids, even if there is a some chance of a security benefit from doing so.

## Nits

### Acknowledgements before security considerations

```
156	4.  Acknowledgements
```

Typically this comes at the end of the document, although I noted that RFC4251 put contributors after the introduction.