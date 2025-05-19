# Orie Steele, ART AD, comments for draft-ietf-dnsop-must-not-ecc-gost-04 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-dnsop-must-not-ecc-gost-04.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

Thanks to Barry Leiba for the ARTART review.

I support Roman's discuss, and Ketan's comments.

### insecure vs not recognized

```
99	   The GOST R 34.11-94 [RFC5933] algorithm MUST NOT be used when
100	   creating DS records.  Validating resolvers MUST treat GOST R 34.11-94
101	   DS records as insecure.  If no other DS records of accepted
102	   cryptographic algorithms are available, the DNS records below the
103	   delegation point MUST be treated as insecure.
```

Perhaps use similar text to draft-ietf-dnsop-must-not-sha1-06:

```
Validating resolvers deployed in more security strict environments MAY wish to treat these RRSIG records as an unsupported algorithm.
```

I'm not familiar with the differences between these cases, but it seems like an opportunity to use similar language.


