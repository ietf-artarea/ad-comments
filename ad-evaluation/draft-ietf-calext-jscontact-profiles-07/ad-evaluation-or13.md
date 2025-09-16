# Orie Steele, ART AD, comments for draft-ietf-calext-jscontact-profiles-07 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-calext-jscontact-profiles-07.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

## Comments

### MAY only

```
188	      types that support this property in this profile.  Each of these
189	      types MUST also be listed in the property contexts for this
190	      property in the "JSContact Properties" registry, but a profile MAY
191	      only support the property in a subset of these contexts.
```

I think this could be made clearer as:

```
a profile MAY forbid/ignore the use of the property in some contexts.
```

Essentially, the intent is that a profile MAY forbid/ignore the use of the property in some contexts?



## Nits

