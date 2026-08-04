# Charles Eckel, ART AD, AD evaluation: draft-ietf-wimse-workload-identity-practices-05 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-wimse-workload-identity-practices-05.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md


Thanks to the authors and the working group for producing this document. It provides an informative survey of current industry practices for workload identity and successfully documents existing practices without attempting to redefine them. Thanks as well to Justin Richer, the document shepherd, for his helpful write-up.

## Comments

### General comment on use of normative language

This document is informational yet makes extensive use of normative language, not only in the security considerations section, but elsewhere as well. This is generally okay; however, BCP14 language (capitalized normative language) is primarily for interoperability, and any "SHOULD" or "SHOULD NOT" statements are likely to draw additional scrutiny as to why they are "SHOULD" instead of "MUST" (i.e., in what cases is it okay to not adhere to the SHOULD).  Using lowercase must/should is still normative, but is not held to the same bar as when capitalized, as clarified in the [IESG Statement on Clarifying the Use of BCP 14 Key Words](https://datatracker.ietf.org/doc/statement-iesg-statement-on-clarifying-the-use-of-bcp-14-key-words/).

It is also important that any use of normative language is done so consistently. 

```
660	   Care must be taken to avoid using the same bearer credential across
661	   different trust domains without appropriate controls.  While direct
```

For consistency with the rest of the section 5, consider s/must/MUST or s/MUST/must elsewhere in section 5. I recommend reviewing all other instances of 'must' and 'should' for consistency. For example, there are several occurrences within Section 5.1 that should be revisited.

### Section 3.1, Environment Variables

```
207	3.1.  Environment Variables

209	   Injecting the credentials into the environment variables allows for
210	   simple and fast deployments.  Applications can directly access them
211	   through system-level mechanisms, e.g., through the env command in
212	   Linux.  Note that environment variables are static in nature in that
213	   they cannot be changed after application initialization.

215	   This delivery pattern is generally discouraged for production
216	   workload identity credentials, because environment variables are
217	   frequently exposed through debugging, logging, process inspection,
218	   and observability tooling.  Security considerations for this pattern
219	   are discussed in Section 5.1.2.
```

Though common practice, use of environment variables in this context needs to be strongly discouraged. The text in this section does mention this is generally discouraged, and section 5.1.2 describes why, but I believe it would be helpful to state this more strongly here by adding something like the following:

``` 
While environment variables are a common delivery pattern, they are highly susceptible to leakage through logging, process inspection, error reporting, and other means. Developers SHOULD prefer filesystem-based mechanisms (Section 3.2) or Local APIs (Section 3.3) where possible.
```

It might be worth considering reordering the sections as well, moving 3.1 Environment Variables to the end.

### Section 4.1, JWK

I do not understand the second part of the second sentence of the following bullet:

```
326	   *  Optionally, a JSON Web Key Set [JWK] is exposed via a web server.
327	      This allows the Service Account Token to be validated outside of
328	      the cluster and access to the actual Kubernetes Control Plane API.
```

Based on what I think it is intended to convey, perhaps it can be reworded as follows:

```
Optionally, a JSON Web Key Set [JWK] is exposed via a web server. This allows external systems to validate Service Account Tokens independently, without requiring direct network access or credentials for the Kubernetes Control Plane API.
```

### Section 4.2, SPIFFE Workload API

```
443	   *  X509-SVID, a X.509 certificate containing the workload's SPIFFE ID
444	      in the Subject Alternative Name (SAN) URI field, along with the
445	      corresponding key pair.

447	   *  JWT-SVID, a signed JWT containing the workload's SPIFFE ID in the
448	      sub claim.  The Workload API does not require clients to
449	      authenticate themselves.

451	   Instead, the API implementation identifies workloads by collecting
452	   contextual information from the environment, such as process
453	   attributes, kernel metadata, or orchestrator-provided labels.  This
```

I believe the following text in the second bullet should be relocated to the start of the paragraph after the second bullet, as follows:

```
*  X509-SVID, a X.509 certificate containing the workload's SPIFFE ID in the Subject Alternative Name (SAN) URI field, along with the corresponding key pair.

*  JWT-SVID, a signed JWT containing the workload's SPIFFE ID in the sub claim.

The Workload API does not require clients to authenticate themselves. Instead, the API implementation identifies workloads by collecting contextual information from the environment, such as process attributes, kernel metadata, or orchestrator-provided labels.  This
```

### Section 5.1.2 Warn more strongly against inappropriate use of env vars 

```
818	   This approach should be limited to non-production cases where
819	   convenience outweighs security considerations, and the provided
820	   secrets are limited in validity or utility.  For example, an initial
821	   secret might be used during the setup of the application.
```

I am not sure if it was intended, but I believe normative language is more appropriate here.

```
This approach SHOULD NOT be used except for non-production cases ...
````

Even this will likely draw scrutiny from our security friends.
Did the working group discuss making this a "MUST NOT" except ...?

### Section 5.2, JOSE typ header

```
895	   Issuers SHOULD strongly type the issued tokens to workloads via the
896	   JOSE typ header and Identity Providers accepting these tokens SHOULD
897	   validate the value of it according to policy.  See Section 3.1 of
898	   [JWT-BCP] for details on explicit typing.  Without explicit typing, a
```

In addition to the reference to [JWT-BCP], it would be helpful to add a reference to RFC 7515, which defines the ``typ`` header parameter. Also, it might be helpful to quote ``typ`` and to expand "typ header" to "``typ`` header parameter."

### Section 5.3, clarify what needs to be validated

```
917	   Some platform-issued credentials have custom claims that are vital
918	   for context and are required to be validated.  For example, in a
```

From the text, it is not clear whether the claims need to be validated, or the claims need to be present for the credential to be validated.

### Section 5.5, handling error case

```
956	   for unauthorized use.  Without a status query mechanism, relying
957	   parties have no way to detect that a workload has been removed and
958	   must accept the token as is.  How these credentials are invalidated
```

"must accept" seems inappropriate and potentially ill-advised in this case. I suggest removing it and leaving the error handling out of scope if no better alternative exists.

## Nits

### Reformat bullets as paragraphs

```
823	5.1.3.  Filesystem

825	   *  1) Access control to the mounted file should be configured to
826	      limit reads to authorized applications.  Linux supports solutions
827	      such as DAC (uid and gid) or MAC (e.g., SELinux, AppArmor).

829	   *  2) Mounted shared memory should be isolated from other host OS
830	      paths and processes.  For example, on Linux this can be achieved
831	      by using namespaces.
```

Something went wrong here. You can simply reformat the bullets as paragraphs, but perhaps some other text was lost and needs to be added back?

### Reword sentence

The second sentence below does not read well.

```
835	   Local APIs often operate in clear-text such as unencrypted HTTP
836	   without any confidentiality or integrity protection.  Privileged
837	   component on the machine or in the infrastructure can be able to
838	   eavesdrop on the connection and the credential within it.
```

I suggest rewording as follows:

```
Local APIs often operate in clear-text, such as unencrypted HTTP, without any confidentiality or integrity protection. Privileged components on a host or in the infrastructure may be able to eavesdrop on a connection and view a credential within it.
```

### Local APIs, consistent caps

```
841	   Server-Side Request Forgery attacks against local APIs.  For example,
```

s/local/Local

### Expand SSRF

```
966	   mitigates token theft.  Without proof of possession, a bearer token
967	   intercepted in transit (e.g., via a compromised log, a man-in-the-
968	   middle, or SSRF) can be replayed by any party, from any location, for
969	   the remaining lifetime of the token.  For X.509-based credentials,
```

Expand SSRF, or consider replacing it with its expanded form as this appears to be the only place it is used.

### quote "aud" in aud claim

```
983	   using the aud claim.  Each JWT SHOULD only carry a single audience.
```

s/aud/``aud``

Note, there are several occurrences of "aud" in this section.

### issuer claim

```
1007	   untrusted or easily forgeable attributes.  In particular, the issuer
1008	   claim in such environments may not uniquely identify a trusted
```

For consistency and clarity, quote "issuer".

s/issuer/``issuer``