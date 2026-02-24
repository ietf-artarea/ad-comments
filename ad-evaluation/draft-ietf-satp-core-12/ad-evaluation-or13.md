# Orie Steele, ART AD, comments for draft-ietf-satp-core-12 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-satp-core-12.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Discuss

### References 

There are lots of broken or unused references in this document.

## Comments

### 2PC vs 3PC

```
23	   networks.  The protocol establishes a secure channel between the
24	   endpoints and implements a 2-phase commit (2PC) to ensure the
25	   properties of transfer atomicity, consistency, isolation and
26	   durability.
```

IMO, if core never describes 3PC, the architecture should either say that, or not introduce 3PC.

### TSL 1.2

```
215	   All messages exchanged between gateways are assumed to run over
216	   TLS1.2 or higher, and the endpoints at the respective gateways are
```

Why not TLS 1.3 ? 

### Legal Owner in Cert

```
216	   TLS1.2 or higher, and the endpoints at the respective gateways are
217	   associated with a certificate indicating the legal owner (or
218	   operator) of the gateway.  HTTPS/S must be used intead of plain HTTP.
```

How? Does this mean that ACME / Let's Encrypt is not allowed?

### Claims

Instead of:

```
254	   *  Claim: An assertion made by an Entity [JWT].

256	   *  Claim Type: Syntax used for representing a Claim Value [JWT].
```

Readers might find something like:

```
The terms Claim, Claim Name and Claim Value are as defined in RFC 7519.
```

However, "Claim Type" is not defined in RFC 7519.

### All Signatures and Keys?

```
377	   SATP gateways SHOULD support the algorithms defined in the JSON Web
378	   Algorithms (JWA) specification [RFC7518] and key types defined in the
379	   JSON Web Key (JWK) specification [RFC7517].  The choice of signature
```

The implication here is that all SHOULD be supported.
Its good that you have a MTI, I don't think you need to encourage the use of all algorithms and key types.

### Base64 JSON

```
476	   The default format of the digital asset Identifier is JSON, with
477	   base64 encoding.
```

You mean that the identifier is an encoded JSON object?

Or that the identifier is a base64 string, which can be found in the JSON messages?

A small example would be helpful.

### JSON Block for TLS Schemes

```
591	   basic scheme (AES-128 in GCM mode with SHA-256), then the client may
592	   may choose to send a JSON block containing information regarding the
593	   client's supported TLS schemes.
```

Is there a reference for this?
Has this been reviewed by the TLS list?

### SAT vs SATP

```
598	   identifier MUST be uniquely bound to its SAT endpoint (e.g. via X.509
599	   certificates).
```

I noticed this in a few other places, are both SAT and SATP used?
It seems better to use SATP consistently.

### Message Payload

```
612	   This is the hash of the current message payload.
```

How is message payload related to the messages in 5.3.2?


### Repeated MTI

```
622	   All implementations MUST support a common default of "ES256", which
623	   is the ECDSA signature algorithm with the P-256 curve and the SHA-256
624	   hash function.
```

Perhaps keep this one, and us a forward reference for the first statement on MTI signature algorithms.


### References for lock types?

```
643	   Currently, the most common type of mechanisms (NetworkLockType) to
644	   temporarily lock an asset in a network are (i) TIME_LOCK, (ii)
645	   HASH_LOCK, (iii) HASH_TIME_LOCK.
```

Are there any networks that implement these lock types?
Perhaps provide at least one reference for each lock type.


### TLS 1.2

Why is TLS 1.2 mandatory? Why not TLS 1.3?


### Nonces are not shown

Not sure why this note occurs.
Are these SATP Nonces?

### JSON string

```
838	   stated, is a JSON string that contains a [X.500] Distinguished Name.
```

I think you mean JSON text, as described in https://datatracker.ietf.org/doc/html/rfc7159#section-2

### Default format

```
843	      for the digital asset located in the origin network.  The default
844	      format is JSON, with base64 encoding.
```

Not sure why this is repeated here.

### Format of Pubkey

```
867	   *  originatorPubkey REQUIRED: This is the public key of the asset
868	      owner (originator) in the origin network or system.
```

Is this a JWK? Can it be other formats?... looks like its hex... what is the format of these keys? Please provide references for undertanding the hex strings.... or use JWK.

```
receiverGatewaySignaturePublicKey
```

why both "Pubkey" and "PublicKey"?

### Some pre-negotiated

```
933	   the peer gateways.  Some of these parameters must be previously
934	   agreed to during the Stage-0 negotiations, which is outside the scope
935	   of this document.
```

Which ones are part of Stage 0?

### hashTransferInitClaim

```
1079	   *  hashTransferInitClaim REQUIRED: Hash of the Transfer
1080	      Initialization Claim received in the Transfer Proposal Message.
```

How is this hash computed? in the claimset normalized before being hashed?
No default algorithm is mentioned (I suggest you address default hashing algorithms once, along with any normalization requirements).

Same question for:

```
1118	   *  hashPrevMessage REQUIRED: The cryptographic hash of the last
1119	      message that caused the rejection to occur.  The default hash
1120	      algorothm is SHA256.
```

### Unrecognized claims must be ignored

This is a common pattern in JSON based protocols.
It was not clear to me if this protocol takes the same approach.


### Rollback

```
1646	   The mechanism to perform recovery and resumption in SATP will be
1647	   defined in a separate specification.
```

Its weird to see this after describing a mechanism.
Is session recovery and resumption mandatory in the protocol?


### resuting & why not MUST?

```
1695	   Connection errors resuting in the time-out of the session SHOULD
1696	   result in the termination of the transfer session.
```

Won't leaving sessions open lead to resource exhaustion?


### Applicability

```
1739	   In general, the termination of sessions or aborts occurring before
1740	   the sender gateway G1 disables (burns) the asset in NW1 (in flow 3.4
1741	   in Figure 2) will incur a minimal cost in terms of computing
1742	   resources or fees on the part of both gateways G1 and G2.
```

The use of "will" here, speaks to applicability of the protocol.
I assume there are some networks where the "fees" are not "minimal".
I would not assert anything about costs, other than to note that they are expected to be non zero for aborted sessions, and that reputation monitoring might be useful as an operational consideration.


### Gateway election

```
1756	      the SATP layer), and for new attempts to be conducted.  If the
1757	      gateway selection mechanisms are utilized by networks NW1 and NW2,
1758	      such attacks may incur more delays because new gateways may have
1759	      to be elected at either network.
```

Is this the first time gateway election is mentioned?
How are election conducted? (consider removing this detail, if it does not generalize well)

### Names without references

```
1795	      uniqueness and reachability.  Existing identification mechanisms
1796	      such a X509 certificates and Verifiable Credentials (VC) and
1797	      Selective Disclosure CBOR Web Tokens (SD-CWT) may be applied for
1798	      gateway identification.
```

I would recommend adding references for these, and only including mechansims that have a very high probability of being used, or where there are already 2 implementations which support the mechanism.


### err_1.1.11

invalid digitalAssetId ... I don't understand how this code would arise from the current protocol, would this not require the receiving network to understand asset ids from the sending network?

Similar questions for the other error codes regarding identifiers.
How would an implementation know if an id is invalid?
based on the current text, the requirement for uniqueness is the only clear requirement I can see.

## Nits

### Support

```
573	   Gateways must suport TLS1.2 or higher [RFC8448].
```

### received

```
1097	   rejection of the the previous message receuved from the client.  This
```

### extra be

```
1617	   primary-backup strategy or self-healing paradigm.  The first strategy
1618	   pertains to the crashed gateway being eventually be replaced by a
1619	   functioning one,while the second strategy focuses on the gateway
```

### maybe?

```
1710	   Note that a session-abort message by be lost and never be received by
1711	   the peer gateway.  Gateways can crash prior to receiving an abort
1712	   message.
```