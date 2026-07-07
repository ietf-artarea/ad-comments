# Andy Newton, ART AD, AD evaluation comments for draft-ietf-satp-core-13 
CC @anewtion1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-satp-core-13.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Comments

### Proper Category

As I was reading through this, I thought it was an protocol requirements document
because it is marked Informational. However, once I saw the IANA registries being setup,
I questioned it.

This is in the shepherd's write-up:

    11. What type of RFC publication is being requested on the IETF stream (Best
    Current Practice, Proposed Standard, Internet Standard,
    Informational, Experimental or Historic)? Why is this the proper type
    of RFC? Do all Datatracker state attributes correctly reflect this intent?

    Proposed Standard.

    Because it defines the core SATP message format to be exchanged between two
    gateways.

    BUT, the document boilerplate has typo: Intended status: Informational.
    Please fix this.

This document is labeled Informational but marked Proposed Standard in the datatracker.
Please correct this.

Also, if this is to be a Proposed Standard, I think the JSON needs to be specified in more concrete terms.
There are examples (some have formatting issues), but either use something like JSON Schema (there is a
new working group on this topic) or specify the JSON more clearly in prose, such as "foo" is a JSON object
with a "bar" string, etc...

### IPR

From the shepherd's write-up:

    12. Have reasonable efforts been made to remind all authors of the intellectual
    property rights (IPR) disclosure obligations described in <a href="/doc/bcp79/">BCP 79</a>? To
    the best of your knowledge, have all required disclosures been filed? If
    not, explain why. If yes, summarize any relevant discussion, including links
    to publicly-available messages when applicable.

    No.

    The shepherd searched the email archive with keywords like "IPR",
    "disclosure", "patent", none came out. It seems the chairs didn't call for
    IPR disclosure.

It would be good if the chairs asked explicitly on the list, but absent that
can the authors assert their IPR disclosures?

### Reference to IANA Registry

A reference to this IANA registry is required.

977	   *  gatewayDefaultSignatureAlgorithm REQUIRED: The default digital
978	      signature algorithm (algorithm-id) from the IANA "JSON Web
979	      Signature and Encryption Algorithms" registry used by a gateway to
980	      sign claims.

....

### JSON Text or JSON String

Do you mean a JSON string? See https://datatracker.ietf.org/doc/html/rfc8259

870	   The format of the identity fields in this message, unless otherwise
871	   stated, is a JSON text.

### Prepended Text

Does these examples have the word "json" prepended?

1001	   json { "gatewayDefaultSignatureAlgorithm": "ES256",
1002	   "gatewaySupportedSignatureAlgorithms": ["ES256", "RSA"],
1003	   "networkLockType": "HASH_TIME_LOCK", "networkLockExpirationTime":
1004	   120, "gatewayTlsScheme": "TLS_AES_128_GCM_SHA256" }

1045	   json { "version": "1.0", "messageType":
1046	   "urn:ietf:satp:msgtype:transfer-proposal-msg", "sessionId":
1047	   "d66a567c-11f2-4729-a0e9-17ce1faf47c1", "transferContextId":
1048	   "89e04e71-bba2-4363-933c-262f42ec07a0", "transferInitClaimFormat":
1049	   "TRANSFER_INIT_CLAIM_FORMAT_1", "transferInitClaim": {
1050	   "digitalAssetId": "2c949e3c-5edb-4a2c-9ef4-20de64b9960d",
1051	   "assetProfileId": "38561", "networkLockType": "HASH_TIME_LOCK",
1052	   "assetLockExpirationTime": 120, "verifiedOriginatorEntityId":
1053	   "CN=Alice, OU=Example Org Unit, O=Example, L=New York, C=US",
1054	   "verifiedBeneficiaryEntityId": "CN=Bob, OU=Case Org Unit, O=Case,
1055	   L=San Francisco, C=US", "originatorPublicKey":
1056	   "0304b9f34d3898b27f85b3d88fa069a879abe14db5060dde466dd1e4a31ff75e44",
1057	   "beneficiaryPublicKey":
1058	   "02a7bc058e1c6f3a79601d046069c9b6d0cb8ea5afc99e6074a5997284756fc9ae",
1059	   "senderGatewaySignaturePublicKey":
1060	   "02a7bc058e1c6f3a79601d046069c9b6d0cb8ea5afc99e6074a5997284756fc9ae",
1061	   "receiverGatewaySignaturePublicKey":
1062	   "0243b12ada6515ada3bf99a7da32e84f00383b5765fd7701528e660449ba5ef260",
1063	   "senderGatewayId": "GW1", "recipientGatewayId": "GW2",
1064	   "senderGatewayNetworkId": "1", "recipientGatewayNetworkId": "43114",
1065	   "senderGatewayDeviceIdentityPublicKey":
1066	   "0245785e34b4a7b457dd4683a297ea3d78bab35f8b2583df55d9df8c69604d0e73",
1067	   "receiverGatewayDeviceIdentityPublicKey":
1068	   "03763f0bc48ff154cff45ea533a9d8a94349d65a45573e4de6ad6495b6e834312b",
1069	   "senderGatewayOwnerId": "CN=GatewayOps, OU=GatewayOps Systems,
1070	   O=GatewayOps LTD, L=Austin, C=US", "receiverGatewayOwnerId":
1071	   "CN=BridgeSolutions, OU=BridgeSolutions Engineering,
1072	   O=BridgeSolutions LTD, L=Austin, C=US" },
1073	   "gatewayAndNetworkCapabilities": {
1074	   "gatewayDefaultSignatureAlgorithm": "ES256",
1075	   "gatewaySupportedSignatureAlgorithms": ["ES256", "RSA"],
1076	   "networkLockType": "HASH_TIME_LOCK", "networkLockExpirationTime":
1077	   120, "gatewayTlsScheme": "TLS_AES_128_GCM_SHA256" } }

Additionally, there are other JSON examples that appear to have stray backslash characters.

### BCP14 Language

There are several places in this document where BCP14 language is not used by appear to be appropriate for interoperatibility:

383	   All SATP messages exchanged between gateways must be signed [ECDSA],
384	   using the JSON Web Signatures mechanism [RFC7515].

573	   SATP Gateways must support JSON Web Tokens (JWT) [RFC7519] with
574	   OAUth2.0 [RFC6749] as the minimal credential type for authenticating
575	   incoming API calls from Client Applications (see Figure 1).

584	   Gateways must support TLS1.3 [RFC8446].

586	   The TLS scheme is used by peer gateways to establish the TLS session
587	   prior to the commencement of an asset transfer.  Gateways must a
588	   minimal support the AES-128 in GCM mode with SHA-256
589	   (TLS_AES_128_GCM_SHA256).

I have caught some, but please review the doc for others.


### Versioning

406	   SATP messages are exchanged between peer gateways, where depending on
407	   the message type one gateway may act as a client of the other (and
408	   vice versa).

What does major mean, and what does minor mean? Are there compatibility semantics associated with either?


### HTTPS/S

Small typo, I think.

216	   All messages exchanged between gateways are assumed to run over
217	   TLS1.3.  HTTPS/S must be used instead of plain HTTP.


### URN Registration

This is registering a subsapce under the IETF NID.

2134	13.2.  URN Registration

2136	   URN: Request to be assigned by IANA.

2138	   Common Name: urn:ietf:satp

2140	   Registrant Contact: IESG

2142	   Description: The secure asset transfer protocol (SATP) requires
2143	   message types, endpoints and parameters to be defined within a unique
2144	   namespace to prevent collision.

But there are URNs used that are not registered:

1597	   *  messageType REQUIRED: It MUST be the value
1598	      urn:ietf:satp:msgtype:error-msg.

1620	   *  messageType REQUIRED: It MUST be the value
1621	      urn:ietf:satp:msgtype:session-abort-msg.

1134	   *  messageType REQUIRED: urn:ietf:satp:msgtype:reject-msg

etc...

Can you verify that you have this correct? Please consult RFC 3688.

### Message Type Registry

I don't believe this satisfies the requirements of RFC 8126.
Please consult that RFC.

1798	13.1.  SATP Error Codes Registry
2146	13.3.  SATP Message Types Registry


### Stray Note

Is there suppose to be something more to this?

1255	   (NOTE: Flows occur over TLS.  Nonces are not shown).

1375	   (NOTE: Flows occur over TLS.  Nonces are not shown).

## Nits

Can we see about fixing these?

idnits 2.17.1 

draft-ietf-satp-core-13.txt:
-(7): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding

  Checking boilerplate required by RFC 5378 and the IETF Trust (see
  https://trustee.ietf.org/license-info):
  ----------------------------------------------------------------------------

     No issues found here.

  Checking nits according to https://www.ietf.org/id-info/1id-guidelines.txt:
  ----------------------------------------------------------------------------

  == There are 3 instances of lines with non-ascii characters in the document.

  == The page length should not exceed 58 lines per page, but there was 2
     longer pages, the longest (page 17) being 78 lines


  Checking nits according to https://www.ietf.org/id-info/checklist :
  ----------------------------------------------------------------------------

  ** There are 6 instances of too long lines in the document, the longest one
     being 1 character in excess of 72.


  Miscellaneous warnings:
  ----------------------------------------------------------------------------

  -- The document date (16 March 2026) is 85 days in the past.  Is this
     intentional?


  Checking references for intended status: Informational
  ----------------------------------------------------------------------------

     No issues found here.

     Summary: 1 error (**), 0 flaws (~~), 2 warnings (==), 1 comment (--).

     Run idnits with the --verbose option for more detailed information about
     the items above.

--------------------------------------------------------------------------------
