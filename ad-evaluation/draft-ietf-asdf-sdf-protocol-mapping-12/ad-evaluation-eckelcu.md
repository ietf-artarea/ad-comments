# Charles Eckel, ART AD, AD evaluation: draft-ietf-asdf-sdf-protocol-mapping-12 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-asdf-sdf-protocol-mapping-12.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

Thanks to Michael Richardson for the shepherd writeup.

## Comments

### BCP 14 keywords

```
128	      agnostic definitions, see Section 3.  An sdfProtocolMap MAY be
129	      applied to an SDF affordance, be it an sdfProperty, sdfEvent or
130	      sdfAction.  The mapping enables use cases such as application
```

```
200	   A protocol MAY choose to extend only the affordance types that are
201	   applicable to it.  For example, the BLE protocol mapping defines
202	   extensions for properties and events but not for actions.
```

```
940	   so, this document defines a SCIM extension that MAY be used in
941	   conjunction with [RFC9944] in Figure 20.  Implementation of this SCIM
```

The above uses of BCP 14 keywords do not appear to be appropriate, as they describe options rather than requirements needed for interoperability. Please consider replacing "MAY" with "can".

### Mapping identifies where, but not how, values are carried

```
131	      gateways or multi-protocol gateways that translate between
132	      different IoT protocols, automated generation of protocol-specific
133	      implementations from SDF models, and interoperability across
```

The introduction states that the mapping enables gateways that translate between protocols. The mappings tell a gateway where a value lives, but not how to convert between the protocol encoding and the SDF data qualities. For example, in Figure 14, the SDF property is a number with unit "Cel", while the Zigbee Temperature Measurement MeasuredValue (attributeType 41, int16) is in hundredths of a degree. Similarly, the BLE Temperature Measurement characteristic uses a flags byte plus an IEEE-11073 FLOAT.

Please state explicitly whether value encoding, scaling, and units conversion are out of scope, and, if so, where an implementer is expected to get that information.

### Handling of unknown or multiple protocol keys

```
169	   The value of the sdfProtocolMap quality is a JSON object nested
170	   inside an SDF affordance definition (sdfProperty, sdfAction, or
171	   sdfEvent).  Protocol-specific attributes are embedded within this
172	   object, keyed by a protocol name registered in the IANA "SDF Protocol
173	   Mapping" registry (Section 8.1), e.g., "ble" or "zigbee".
```

What is an implementation expected to do when it encounters a protocol key it does not recognize? Ignore it, or reject the model? Also, when an affordance carries mappings for more than one protocol, are they alternatives (the device can be reached by either), or something else? A sentence or two on each might help interoperability.

### Inconsistent normative language for extending protocol maps

```
239	   To extend $$SDF-PROPERTY-PROTOCOL-MAP for a new protocol (e.g., "new-
240	   protocol"), implementers MUST use the property-protocol-map generic
241	   with the protocol name and a map type defining the protocol-specific
242	   attributes.
```

```
374	   require the read/write distinction.  To extend $$SDF-ACTION-PROTOCOL-
375	   MAP for a new protocol, implementers MUST add a group entry that maps
376	   the protocol name to the protocol-specific attributes.  For example,
```

```
419	   Events follow the same simple pattern as actions.  To extend $$SDF-
420	   EVENT-PROTOCOL-MAP for a new protocol, implementers add a group entry
421	   that maps the protocol name to the protocol-specific attributes.  For
```

The property and action text use MUST, but the equivalent event text does not. Please make the three sections consistent (e.g., s/implementers add/implementers MUST add on line 420).

### Hex vs. decimal identifiers

```
474	             "profileID": 260,
475	             "clusterID": 1026,
```

Zigbee identifiers are usually written in hexadecimal (e.g., cluster 0x0402, profile 0x0104), but the JSON examples use decimal (1026, 260). A short note that the JSON values are the decimal form of these identifiers might help readers cross-check against the Zigbee specifications.

### Zigbee event field presence

```
793	   *  endpointID, clusterID, attributeID, attributeType, profileID, and
794	      manufacturerCode have the same meaning as described for
795	      sdfProperty in Figure 17.  These fields are present when type is
796	      "attribute_reporting" or "write_event", and MUST be absent when
797	      type is "connection_events".
```

The meaning of "are present" is not clear to me, especially in light of the normative language later in the same sentence. Is the intent that endpointID, clusterID, attributeID, and attributeType MUST be present (profileID and manufacturerCode being optional)?

### SCIM expert review

Section 5 defines a new SCIM schema extension, and Section 8.2 registers it in the "SCIM Server-Related Schema URIs" registry. Has this been reviewed by someone with SCIM expertise (e.g., from the SCIM WG)? The shepherd writeup does not mention such a review. If not, I think one would be helpful.

### Security Considerations

```
1056	   Each protocol mapped using this mechanism has its own security model.
1057	   The protocol mapping mechanism defined in this document does not
1058	   provide additional security beyond what is offered by the underlying
1059	   protocols.  Implementations MUST ensure that appropriate protocol-
1060	   level security mechanisms are employed when accessing affordances
1061	   through the mapped protocol operations.
```

The MUST is not actionable as written. Some considerations specific to this document that may be worth covering:

* Integrity and authenticity of SDF models: a gateway that acts on a tampered or untrusted model could be directed to write to unintended attributes or send unintended commands to devices.
* The SCIM extension carries URIs that a server or gateway may dereference, with the usual considerations for fetching untrusted URIs.
* The SDF model references in a SCIM device object may reveal device type and capabilities (privacy).
* For "connection_events" and advertisements, presence information about devices.

### IANA registry details

```
1106	   The registrant of an existing entry may request updates to that
1107	   entry, subject to the same expert review.  They should verify that
1108	   updates preserve backward compatibility with deployed
1109	   implementations, or if breaking changes are necessary, consider
1110	   whether a new registry entry is more appropriate.
```

"They" is ambiguous. Is it the registrant or the designated expert(s)?

### Choice of referenced specification versions

```
1149	   [BLE53]    Bluetooth SIG, "Bluetooth Core Specification Version 5.3",
...
1196	   [ZCL7]     Connectivity Standards Alliance, "Zigbee Cluster Library
1197	              Specification", CSA Document 07-5123 (Revision 7),
...
1201	   [Zigbee30] Connectivity Standards Alliance, "Zigbee Specification",
1202	              CSA Document 05-3474-23 (Revision R23.1), July 2024,
```

Is there a reason for referencing these particular versions rather than the latest ones (e.g., Bluetooth 6.3, ZCL Revision 8)? Also, the [Zigbee30] label suggests Zigbee 3.0, but the reference is to the Zigbee PRO R23.1 specification. Consider a label that aligns with the reference.

### OpenAPI model instructions and version

```
1349	     description: |-
1350	       SDF Protocol Mapping. When adding a
1351	       new protocol mapping please add a reference to the protocol map
1352	       for all the schemas in this file.
1353	     version: 0.10.0
```

The instruction to add references to this file cannot be followed once the document is an RFC. Consider removing it, or explaining how future mappings are expected to provide OpenAPI models. 

Also consider whether `version: 0.10.0` and the externalDocs URL pointing to this draft should be updated for publication (e.g., a note to the RFC Editor). This applies to all three OpenAPI models: ProtocolMap.yaml (lines 1353-1357), ProtocolMap-BLE.yaml (lines 1408-1412), and ProtocolMap-Zigbee.yaml (lines 1512-1516).

## Nits

### Workgroup name in the document header

```
2	A Semantic Definition Format for Data and Interactions of ThingsR. Mohan
```

The workgroup name collides with the first author's name in the first-page header. Upon checking with the RFC editor, the recommendation is that the WG name be replaced with its abbreviation in the XML file:

CURRENT:

```
<workgroup>A Semantic Definition Format for Data and Interactions of Things</workgroup>
```

PROPOSED:

```
<workgroup>ASDF</workgroup>
```

### generic or template

```
225	   The property-protocol-map generic (Figure 2) captures the common
```

This wording sounds a bit odd. Consider:

s/The property-protocol-map generic/The property-protocol-map template

or

s/The property-protocol-map generic/The generic property-protocol-map

### Wordy phrasing

```
244	   It is to be noted that the protocol name (e.g., "new-protocol") MUST
245	   be registered in the IANA registry defined in Section 8.1.
```

s/It is to be noted that the/The

### Comma after "e.g."

```
453	   Affordances often share most of their protocol mapping, e.g. when
```

s/e.g./e.g.,

### SCIM section readability

CURRENT:

```
939	   an instance of a device and its associated SDF models.  To accomplish
940	   so, this document defines a SCIM extension that MAY be used in
941	   conjunction with [RFC9944] in Figure 20.  Implementation of this SCIM
```

PROPOSED:

```
939	   an instance of a device and its associated SDF models.  To accomplish
940	   this, this document defines a SCIM extension (Figure 20) that can be
941	   used in conjunction with [RFC9944].  Implementation of this SCIM
```

Note that the change from "MAY" to "can" is covered in the "BCP 14 keywords" comment.

### IANA wording

```
1081	   *  Reference of the specification describing the protocol mapping.
```

s/Reference of/Reference to

```
1129	   IANA is requested to create the following extension in the "SCIM
```

s/create/register

### Ambiguous "this document" in Acknowledgements

```
1756	   This document relies on SDF models described in [RFC9880], as such,
1757	   we are grateful to the authors of this document for putting their
```

s/[RFC9880], as such,/[RFC9880]; as such,

s/authors of this document/authors of that document