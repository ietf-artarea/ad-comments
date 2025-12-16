# Andy Newton, ART AD, comments for draft-ietf-rift-kv-tie-structure-and-processing-06 
CC @anewton1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-rift-kv-tie-structure-and-processing-06.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

Thanks for the work on this document.

## Comments

### IANA Review

This is from the IANA review of -05:

    The new registry will be managed via Expert Review as defined by RFC8126. There are initial registrations in the new registry as follows:

    Value Key-Type Description Reference
    -----+---------+-----------+-----------
    0 Illegal Not allowed [ RFC-to-be ]
    1 Experimental Indicates that the Key-Type is Experimental [ RFC-to-be ]
    2 Well-Known Indicates that the Key-Type is Well-Known [ RFC-to-be ]
    3 OUI Indicates that the Key-Type is OUI (vendor specific) [ RFC-to-be ]
    4-65535 Unassigned

Isn't unassigned suppose to be 4-255?

### Normative Algorithm

347	   Any other value MUST be derived from the following normative
348	   algorithm.  Note that while the algorithm is shown using example code
349	   written in [Rust], this document does not mandate the use of any
350	   particular language for implementation.

Rust, FTW!

352	<CODE BEGINS>
353	/// random seeds used in algorithms to increase entropy
354	pub const RANDOMSEEDS: [UnsignedSystemID; 3] = [
355	    67438371571u64,
356	    37087353685,
357	    88675895388,
358	];

360	/// given a system ID delivers the bits set by the according Bloom Filter in the southbound
361	/// key value target.
362	///
363	/// @note: This is standardized and cannot be changed between releases!
364	pub (crate) fn target2bits(target: UnsignedSystemID) -> KeyValueTargetType {
365	    (0 as usize .. 3)
366	        .map(|s| {
367	            let rot = (target ^ RANDOMSEEDS[s]).rotate_left(s as _);
368	            rot.to_ne_bytes().iter().fold(0, |v: u8, nv| v.rotate_right(4) ^ *nv) % 64
369	        })
370	        .fold(0, |v, nv| v | (1 << nv))
371	}
372	<CODE ENDS>

What is the "@note" on line 363? Does that need to be removed?
