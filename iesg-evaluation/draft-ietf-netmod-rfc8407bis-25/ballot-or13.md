# Orie Steele, ART AD, comments for draft-ietf-netmod-rfc8407bis-25 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-netmod-rfc8407bis-25.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### Why not MUST?

#### Tree Diagrams

```
561	   YANG tree diagrams provide a concise representation of a YANG module
562	   and SHOULD be included to help readers understand YANG module
563	   structure.  Guidelines on tree diagrams can be found in Section 3 of
564	   [RFC8340].  Tree diagrams longer than one page SHOULD be included in
565	   an appendix, i.e., not in the main body of the document.
```

Under which cases should tree diagrams not be included?


#### Consistent indentation

```
597	   Consistent indentation SHOULD be used for all examples, including
598	   YANG fragments and protocol message instance data.  If line wrapping
```

```
677	   Consistent indentation and formatting SHOULD be used in all YANG
678	   statements within a module.
```

What is consistent formatting?
Why are these SHOULDs, when are exceptions expected or encouraged?

#### Module names

```
1059	   A distinctive word or abbreviation (e.g., protocol name or working
1060	   group abbreviation) SHOULD be used in the module name.  If new
```

### IESG as Contact for YANG Modules

```
900	       URI:
901	       Registrant Contact:  The IESG.
902	       XML: N/A; the requested URI is an XML namespace.
```

I recognize this comes from the XML namespace registration process...
Is the IESG truly the best contact choice for these YANG registration templates now?

#### include prefix in YANG identity

```
1518	   XPath expressions that contain a literal value representing a YANG
1519	   identity SHOULD always include the declared prefix of the module
1520	   where the identity is defined.
```

When is this not a good idea?

#### IETF WG as organization

```
1656	   The "organization" statement MUST be present.  If the module is
1657	   contained in a document intended for IETF Standards Track status,
1658	   then the organization SHOULD be the IETF working group (WG) chartered
1659	   to write the document.  For other standards organizations, a similar
1660	   approach is also suggested.
```

When is a different organization name than the IETF WG recommended?


### define validated

```
1010	   the YANG module(s).  Examples MUST be validated.  Refer to
```

This implies validation, but does not require tools to agree on outcome.
Not being a YANG expert, I'm not sure if there is more useful guidance to be provided here.


### Code markers and text

```
1034	   In order to ease extraction and validation of examples, it is
1035	   RECOMMENDED to use code markers.
```

Does this imply that consumers of yang should also prefer to use representations that support code markers?


### How to check for uniqueness

```
1065	   All published module names MUST be unique.  For a YANG module
1066	   published in an RFC, this uniqueness is guaranteed by IANA
1067	   (Section 14 of [RFC6020]).  For unpublished modules, the authors need
1068	   to check that no other work in progress is using the same module
1069	   name.
```

How should authors perform this check? Is there a mailing list?


#### Why MAY?

```
1153	   For convenience, prefix values of example modules MAY be prefixed
1154	   with "ex" or similar patterns.  In doing so, readers of example
1155	   modules or tree diagrams that mix both example and standard modules
1156	   can easily identify example parts.
```

Seems like this would improve readability.



### SHOULD consider

```
1510	   and the XPath value space.  The data types are not the same in both,
1511	   and conversion between YANG and XPath data types SHOULD be considered
1512	   carefully.
```

Consider making this SHOULD lower case.

## Nits


### moodules 🐄

```
1089	   definition being referenced.  This allows the same name to be used in
1090	   multiple moodules, even if the names are not unique.  In the example
```

### sytnax error?

```
1642	       leaf reserved {
1643	         type string;
1644	         description
1645	           "This object has no purpose at this time, but a future
1646	            revision of this module might define a purpose
1647	            for this object.";
1648	         }
1649	       }
```

Missing `}` ?


### Trailing :

```
1806	   A standard namespace statement value SHOULD have the following form:

1808	       <URN prefix string>:<module-name>

1810	   The following URN prefix string SHOULD be used for published and
1811	   unpublished YANG modules:

1813	       urn:ietf:params:xml:ns:yang:
```

This reads like "urn:ietf:params:xml:ns:yang::ietf-netconf-partial-lock" would be expected.








