# Orie Steele, ART AD, comments for draft-ietf-core-dns-over-coap-17 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-core-dns-over-coap-17.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks to Todd Herr for the ARTART review.

## Comments

### Why not MUST?

```
252	   discovery of designated resolvers [RFC9462].  Automatic configuration
253	   SHOULD only be done from a trusted source.
```

Suggest to strengthen the language to "MUST" or provide a rationale for why it is "SHOULD".


### confusing MAY

```
302	   list.  The same considerations for the "," and "" characters in
303	   docpath-segments for zone-file implementations as for the alpn-ids in
304	   an "alpn" SvcParam MAY apply (Section 7.1.1 of [RFC9460]).
```

Do you need the "MAY" here, is it not enough to say the same considerations apply?
I only skimmed 7.1.1 but it also contains a MAY, which I read as being sufficiently clear.

### Why not MUST?

```
375	      If not, or if the endpoint becomes unreachable, the algorithm
376	      SHOULD be repeated with the SVCB record with the next highest
377	      priority.
```

Are there other strategies implied by this should, or is this a should only because retry is not required?

### MUST be able to understand when not accepted

```
525	   Section 4.1) when requested.  A DoC client MUST be able to understand
526	   responses in the "application/dns-message" Content-Format when it
527	   does not send an Accept option.  Any response Content-Format other
```

I think this is better phrased as "use of the accept header is optional, however, all DoC clients MUST understand the "application/dns-message" Content-Format".
Possibly an alterantive wording would be clearer.

