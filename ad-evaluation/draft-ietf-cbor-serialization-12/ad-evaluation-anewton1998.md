# Andy Newton, ART AD, AD evaluation comments for draft-ietf-cbor-serialization-12 
CC @anewtion1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-cbor-serialization-12.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Comments

This document is in great shape, and I really appreciate all the hard work
that was been given to it. I also note that Appendix A & B were actually
enjoyable to read.

I have the following comments.

### Abstract

11	Abstract

13	   RFC 8949 defines CBOR, a standard for serializing data types such as
14	   integers, strings, and arrays into encoded bytes.  CBOR serialization
15	   is flexible, allowing data types to be encoded in multiple ways to
16	   accommodate deployment in constrained environments.  This document
17	   normatively defines one particular serialization, called "preferred-
18	   plus serialization," that is suitable for the majority of CBOR-based
19	   protocols.  Protocol designers and implementers who choose it need
20	   not understand or specify serialization details themselves.  This
21	   document also normatively defines a deterministic serialization.
22	   These serializations are largely compatible with those widely
23	   implemented by the CBOR community.

I found the first paragraph of the abstract confusing. What about?

    RFC 8949 defines CBOR, a standard for serializing data types such as
    integers, strings, and arrays into encoded bytes.  CBOR serialization
    is flexible, allowing data types to be encoded in multiple ways to
    accommodate deployment in constrained environments.

    This document updates the serialization of RFC 8949, giving it the name
    "general serialization" for distinction against other CBOR serializtion
    methods. This document also defines two other CBOR serializations,
    "preferred-plus serialization" and "deterministic serializaton". Both
    are largely compatible with those widely current CBOR implementations.

### Information Model vs Data Model

I really like this description.
 
173	   +================+=============+===================+================+
174	   |                | Information | Data Model        | Serialization  |
175	   |                | Model       |                   |                |
176	   +================+=============+===================+================+
177	   | Abstraction    | Top level;  | Realization of    | Actual bytes   |
178	   | Level          | conceptual  | information in    | encoded for    |
179	   |                |             | data structures   | transmission   |
180	   |                |             | and data types    |                |
181	   +----------------+-------------+-------------------+----------------+
182	   | Example        | The         | A floating-       | Encoded CBOR   |
183	   |                | temperature | point number      | of a floating- |
184	   |                | of          | representing      | point number   |
185	   |                | something   | the temperature   |                |
186	   +----------------+-------------+-------------------+----------------+
187	   | Standards      | e.g., [UML] | CDDL [RFC8610]    | CBOR [RFC8949] |
188	   +----------------+-------------+-------------------+----------------+
189	   | Implementation | n/a         | API input to      | Encoded CBOR   |
190	   | Representation |             | CBOR encoder      | in memory or   |
191	   |                |             | library, output   | for            |
192	   |                |             | from CBOR         | transmission   |
193	   |                |             | decoder library   |                |
194	   +----------------+-------------+-------------------+----------------+

Shouldn't the implementation representation of the information model be something
like "requirements specification" instead of "n/a"?

### Rust Dynamic Types

259	   Decoders in particular often support only a subset of serialization
260	   forms — whether because they operate in constrained environments, or
261	   because a full general-purpose decoder is substantially more work to
262	   implement, especially in languages like C and Rust that lack built-in
263	   dynamic arrays, maps, and strings.

What does dynamic mean here? Is this about dynamic typing or growable structures?
Because if this is about growable structures, I believe this statement is incorrect
when it comes to Rust.

Also, I always assumed that the real issue with indefinite-length arrays regards
zero-copy buffering, which can be problematic in more than just C and Rust.

Maybe this is better:

    Decoders in particular often support only a subset of serialization forms,
    whether because they operate in constrained environments or because supporting
    all serialization variants can complicate memory management and decoding processes.
    For example, indefinite-length byte and text strings may require complex
    buffering and APIs that otherwise easily support zero-copy decoding.

### Is this a double negative?

408	   ...  If a protocol does not need to be deployed where map
409	   sorting is too expensive, requiring deterministic serialization —
410	   conformance with Section 5.1 and Section 5.2 — is also RECOMMENDED.

What about?

    If a protocol can be deployed in environments where map sorting is acceptable....

### Requiring Preferred Plus

423	   An end-to-end protocol that gives no serialization requirements is
424	   ambiguous.  For such extant protocols, use of preferred-plus
425	   serialization is RECOMMENDED unless existing deployments of that
426	   protocol have established a different practice.

Is there a reason preferred-plus cannot be REQUIRED unless existing deployments
have established different practices? Doing so would mitigate non-interoperability,
and BCP14 SHOULD/RECOMMEND etc.. are not simple choices. What reasonable engineering
decision exists to ignore the recommendation other than the caveat given? If this
is to be left as RECOMMENDED, IMHO the statement should be strengthened to say that
the ambiquity is likely to cause non-interoperability with some implementations.

466	   When a framework protocol specification does not mandate a specific
467	   serialization, it is RECOMMENDED that a library for it implement
468	   preferred-plus serialization.  For example, CWT does not mandate a
469	   serialization, so it is recommended that libraries implementing them
470	   use preferred-plus serialization.  Alternatively, a framework
471	   protocol library may implement only deterministic serialization if
472	   this aligns with its deployment environment and design goals.

Likewise for this. IMHO, the consequences regarding non-interoperability need to
be more clearly stated, or the statement should be upgarded to REQUIRED.

487	   If an end-to-end protocol specification does not state serialization
488	   requirements, it is RECOMMENDED that the library implement preferred-
489	   plus serialization, unless existing deployments of that protocol have
490	   established a different practice (see Section 2.1.2).

Ditto!

## Nits

551	   A protocol that requires general serialization needs to state so
552	   explicitly; see Section {EndToEndProtocols}.

Curly braces.

934	      Deterministic serialization MUST be used, except that maps and
935	         arrays MUST be encoded with indefinite lengths.  Strings retain
936	         definite-length encoding, and map ordering MUST follow the
937	         rules of deterministic serialization.

Indentation.

980	   stuff = ...
981	   deterministic-stuff = stuff .serial "dtrm"
982	   wrapped-deterministic-stuff = #6.24(bytes .cbor deterministic-stuff)

and

987	   my-prefp-protocol = my-protocol .serial "prefp"
988	   my-protocol = ...

Are these suppose to be figures?

IDNITsv3 is complaining about code blocks:
https://author-tools.ietf.org/idnits3/results?url=https://www.ietf.org/archive/id/draft-ietf-cbor-serialization-12.txt
