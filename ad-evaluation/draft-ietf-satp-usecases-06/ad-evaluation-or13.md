# Orie Steele, ART AD, comments for draft-ietf-satp-usecases-06 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-satp-usecases-06.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

### Boilerplate

```
  Miscellaneous warnings:
  ----------------------------------------------------------------------------

  == The copyright year in the IETF Trust and authors Copyright Line does not
     match the current year
```

This is easily resolved by simply pushing a new verision with no other changes.


## Comments

### Augmented EPP

```
823	   Alice, who owns an SLD (say alice.com) issued by GoDaddy, wishes to
```

alice.com is currently a coffee website.

Consider making these examples more durable using `.example`. Instead of `.com`.

We should also make sure the REGEXT WG has a chance to review this section carefully.

I looked on both mailing lists:

- https://mailarchive.ietf.org/arch/browse/sat/?q=regext
- https://mailarchive.ietf.org/arch/browse/regext/?q=satp

I don't see much evidence of a discussion on this topic.

Chairs please coordinate with the REGEXT chairs to ensure this section gets a public review by both working groups.

Or if I missed this, please point me to the discussion.

### IPR

From the shepherd's writeup:

```
12. Have reasonable efforts been made to remind all authors of the intellectual
property rights (IPR) disclosure obligations described in <a href="/doc/bcp79/">BCP 79</a>? To
the best of your knowledge, have all required disclosures been filed? If
not, explain why. If yes, summarize any relevant discussion, including links
to publicly-available messages when applicable.

No. The proposed use cases are common contents, so there is no any risk of
IPR.
```

This response (the no part) does not make sense to me.

I would prefer a reference to a public mailing list, or an assertion that the reminder has been given to the authors.

## Nits

### Weird spacing issue

See the idnits file starting on line 100.

### Use of the term "we"

I know its common in academic writing, but its less common in IETF documents because its not clear who "we" is referring to... is it the WG? the authors? the IETF as a whole?

I would suggest avoiding the use of it, if possible.