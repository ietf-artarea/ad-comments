# Orie Steele, ART AD, comments for draft-ietf-satp-architecture-08 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-satp-architecture-08.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

### Unused References

See ID Nits for details.

There are lots of unused references in this document, and some that are broken.

This must be fixed before the document is progressed.

For example, this reference is broken:

```
113	   from NIST [NIST and ISO [ISO].  New terms have been introduced
```

### Security

```
938	   For confidentiality of a transfer, the secure asset transfer protocol
939	   must utilize a TLS1.2 (TLS1.3) secure channel that must be
```

Why not must use TLS1.3 or later?
If TLS1.2 is required, I suggest explaining that in a dedicated section.



### Stage 0 .... Not really out of scope


```
573	6.  Pre-transfer Verification and Context Establishment (Stage-0)

575	   Although Stage 0 is out of scope for the current architecture, it is
576	   discussed here in order to provide background with the regards to the
577	   various asset verification requirements prior to commencing the
578	   transfer in Stage 1.

580	   Several tasks need to be conducted as part of the pre-transfer:
```

... [Lots of scope]

I don't think you can say "out of scope" and then have:

```
In jurisdictions where the Travel Rule policies regarding originator and beneficiary information is enforced [FATF], the owners of gateways G1 and G2 must comply to the Travel Rule.
```

You are creating a requirement for Stage 0 here.

The casing of the word "must" does not change the fact that you are putting stage 0 in scope with this sentence.

I would suggest fixing this by removing the "out of scope" comment, the architecture is informational anyway.

Later:

```
1044	13.  Compatibility Considerations

1046	   As the asset transfer protocol must be agnostic to the anatomy of a
1047	   digital asset and to the type of ledger technology underlying a
1048	   system maintaining digital assets, it must be compatible with
1049	   different asset identification standards like ISO 20022 and ITIN, and
1050	   with standards for communicating information about business processes
1051	   (like ISO 20022).  Keeping the Stage-0 specification open and not
1052	   tied to a specific messaging or identification standard allows the
1053	   Secure Asset Transfer architecture to be flexible and inclusive, and
1054	   thereby meet compatibility goals.
```

Again a requirement on stage 0, in the architecture document.

I'd like to explore what a minimal charter change to allow Stage 0 to be in scope would mean for this document.



## Comments


### Reading order

You might consider recommending the reader start with use cases, then architecture, then core protocol.

### Repeated Terminology Section

The Architecture and Use Cases drafts both define a Terminology section but use different wording for the same terms. Aligning these would improve consistency across the SATP document set.

* **Asset network (system)**  
  - Use Cases: "The network or system where a digital asset is utilized."  
  - Architecture: "The network or system where an asset is digitally represented (e.g., as a token)."

* **Protocol name**  
  - Use Cases: "Secure Asset Transfer Protocol (SATP)" (with [SATP] reference).  
  - Architecture: "Asset Transfer Protocol" (no "Secure", no "SATP" in the term).

* **Origin network**  
  - Use Cases: "The current network where the digital asset is located."  
  - Architecture: "The current asset network where the digital asset is located."

* **Destination network**  
  - Use Cases: "The network to which a digital asset is to be transferred."  
  - Architecture: "The asset network to which a digital asset is to be transferred."

Please consider aligning the Architecture terminology with the Use Cases document (or vice versa) so the same terms are used consistently.


### commitment

This words is used a lot, I am not sure it needs special treatment, but I do wonder how it is being read by different stakeholders.

Is it:

```
In database management, commitment (often referred to as a COMMIT) is the finalization of a transaction, ensuring that all data modifications made during that transaction are permanently saved to the database.
```

or:

```
In blockchain technology, commitment refers to a cryptographic mechanism that allows a party to lock in a specific value (such as a transaction, a vote, or data) and publish it, while keeping the actual value hidden from others until a later reveal phase
```

### should not must

Even though not capitalized I wonder why these are not must.

```
425	   An implementation of the asset transfer protocol should satisfy these
426	   properties, independent of whether the implementation employs
```

```
470	   Implementations of a gateway should maintain event logs and
471	   checkpoints for the purpose of gateway crash recovery.  The log-data
472	   generated by a gateway should be considered as an interior resource
473	   accessible to other authorized gateways within the same network.
```

... There are lots of these... Consider each case, and assume the reader chooses to interpret the should as "MUST NOT"... what happens to the architecture?

### Standardized

```
480	   A standardized semantics and syntax for log-data generated by SATP
481	   gateways in the context of asset transfers enables multiple
482	   implementations of gateways to serve a given asset network.  For
```

Does this exist anywhere that can be referenced?

Later:

```
918	   The precise form of these assertions must be standardized (for the
919	   given transactional commitment protocol) to eliminate any ambiguity.
```

Is this a setup for a future document? Its not clear if this is possible, and if its not, what is the value of SATP in absence of this?


### Asset ID

```
591	      transfer assets whose ownership is unverified.  An asset may be
592	      identified by way of a combination of the network-identifier and a
593	      cryptographic hash of the ledger data representing the asset.
```

This seems like its assuming a lot about the ledger, which is supposed to be opaque.
Shouldn't this just be phrased in terms of some uniqueness properties?

Consider deleting this may, sentence.

### 2PC vs 3PC

```
726	   proposal finalization (1.1 and 1.2), prior to starting the 2PC
```

3PC is introduced, but 2PC is not... its also not clear to me why both are being mentioned here.

Does the architecture require both?

This is answered later:

```
899	   For example, in Stage 2 and Stage 3 discussed above the gateways G1
900	   and G2 may implement the classic 2-Phase or 3-Phase Commit (2PC or
901	   3PC) sub-protocol [Gray81] as a means to ensure efficient and non-
902	   disputable commitments to the asset transfer.
```

The real requirement appears to be at least one "transactional commitment sub-protocols" must be implemented.

I would recommend leaving interoperability related details to the core protocol document, and just describe the requirement in the informational architecture document.


### networks (ledgers)

```
810	   making permanent the changes they made to the respective networks
811	   (ledgers).  The previous signed receipt message (2.4) from gateway G2
```

There are several cases where the word "ledger" is used, and I don't know that it helps improve clarity... I would suggest just using the term network, and disambiguate once, so you don't need to keep using the term ledger.

### should .... hashes

```
819	      the commitment of the transfer.  This message should include
820	      hashes of the previous messages (message 2.2 and 2.4).
```

I assume its ok to ignore this?

What perhaps it would be better to describe the security property that needs to be achieved here, instead of the mechanism?... I am assuming this will be covered in thre core protocol document if its important.


### G1 was NOT able?

```
1001	   type of denial-of-service is network specific because it implies that
1002	   G1 was able to perform a lock on the asset on behalf of the asset-
1003	   owner (i.e. originator) through one or more mechanisms supported by
```

G1 needs the lock to be able to burn right?




## Nits

### Indentation

Weird indentation starts around line 100 in the document.


### Extra the

```
220	      applications (App1 and App2).  Furthermore, this context-
221	      identifier is assumed to have been delivered by the each
222	      application to its corresponding gateway, permitting each gateway
```

### Missing are

```
400	   The desirable features of asset transfers between two gateways
401	   include, but not limited, to the following:
```


### Reached

```
983	   message is lost and will assume that the transaction has reach
984	   completion in network NW2.  The sender gateway G1 has retained the
```