# Orie Steele, ART AD, comments for draft-ietf-core-href-25 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-core-href-25.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Discuss

### Designated experts


```
1592	   When the expert notices that a registration has been made in the
1593	   Uniform Resource Identifier (URI) Schemes registry (see also
1594	   Section 11.2), the expert is requested to initiate a parallel
1595	   registration in the CRI Scheme Numbers registry.  CRI scheme number
```

It seems likely that this will not happen (eventually).
And further, that there is high probability that one day a URI and CRI will have similar names, while being otherwise unrelated.

Per:

```
1614	   A registration in the CRI Scheme Numbers registry does not imply that
1615	   a URI scheme under this name exists or has been registered in the
1616	   Uniform Resource Identifier (URI) Schemes registry -- it essentially
1617	   is only providing an integer identifier for an otherwise
1618	   uninterpreted text string.
```

Would it not be better to have a single registry, and just add a column for integer values?

Keeping 2 registries in sync via expert review and a "note" seems doomed to fail.

## Comments

Thanks to Arnt Gulbrandsen for the ARTART review.
And to the authors for addressing his comments.
...and to idnits 2.17.1 for complaining about lines appearing to long due to UTF-8 encoding.



