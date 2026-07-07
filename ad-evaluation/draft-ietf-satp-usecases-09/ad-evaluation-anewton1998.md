# Andy Newton, ART AD, AD evaluation comments for draft-ietf-satp-usecases-09 
CC @anewtion1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-satp-usecases-09.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Comments

### Proper Nouns

We should not be using proper nouns as examples. References to people and organizations
by name should only be done normatively.

281	   network can be augmented by adding a food tracking network like the
282	   IBM Food Trust [IFT] to the mix.  Such a network connects producers,

327	   different countries and enables cross-border payments, an example
328	   being the Stellar network [STN].  After goods have been dispatched,

OCC appears to be an actual company: https://www.theocc.com/
It is difficult for me to understand from the text if OCC is a theoretical entity
or the actual OCC.

CBOE should be removed.

618	   (which can be labeled a “stock network”) to which entities like an
619	   Options Clearing Corporation (OCC), stock exchanges (e.g., the
620	   Chicago Board Options Exchange), and brokerage firms, belong.  The
621	   OCC is the issuer and guarantor for all options and futures contracts
622	   traded on U.S. exchanges [OCC].  It provides secured back-end

Netflix should definitely be removed. Is IPTV a technology? If so, is there a reference?

742	   Streaming services like Netflix and IPTV can tap into the

### Extra Exporter Box

Is there an extra box for Exporter at line 224-226?

219	               +----------+    1 Agree on      +----------+
220	               | Exporter |<------------------>| Importer |
221	               +----------+   Purchase Order   +----------+

223	      +------------+
224	      | Exporter’s |  +----------+              +---------------------+
225	      |    Bank    |  | Exporter |              |       Exporter      |
226	      +------------+  +----------+              +---------------------+
227	            | |                                    | |              |
228	       4    | |   12                        5      | |      7       |   9
229	    Approve | | Request                   Book     | |   Create     | Accept
230	      L/C   | |   L/C                  Consignment | | Consignment  |  B/L
231	            | |                                    | |              |
232	            | |                                    | |              |
233	            | |            |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|  | |              |
234	            | |            |    11 Share B/L    |  | |              |
235	            V V            V                    |  V V              V
236	    +-------------------------------+     +-------------------------------+
237	    |     Trade Finance Network     |     |    Trade Logistics Network    |
238	    +-------------------------------+     +-------------------------------+
239	            ˄              ˄    |               ˄      ˄     ˄
240	            |              |    |  6 Share L/C  |      |     |
241	            |              |    |_______________|      |     |
242	            |              |                           |     |
243	       3    |              |    2               10     |     |    8
244	    Propose |              | Request        Dispatch   |     | Upload
245	      L/C   |              |   L/C         Consignment |     |   B/L
246	            |              |                           |     |
247	      +------------+  +----------+                 +-------------+
248	      | Importer’s |  | Importer |                 |   Carrier   |
249	      |    Bank    |  +----------+                 +-------------+
250	      +------------+


## Nits

I ran this through IDNITs and it spit out a very large set of nits.
Normally we can let one or two nits slide, but this needs to be taken
care of before moving forward.

idnits 2.17.1 

draft-ietf-satp-usecases-09.txt:
-(177): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(224): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(233): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(264): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(293): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(307): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(309): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(311): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(338): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(340): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(342): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(408): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(423): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(426): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(569): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(577): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(589): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(597): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(618): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(630): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(637): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(648): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding
-(902): Line appears to be too long, but this could be caused by non-ascii characters in UTF-8 encoding

  Checking boilerplate required by RFC 5378 and the IETF Trust (see
  https://trustee.ietf.org/license-info):
  ----------------------------------------------------------------------------

     No issues found here.

  Checking nits according to https://www.ietf.org/id-info/1id-guidelines.txt:
  ----------------------------------------------------------------------------

  == There are 58 instances of lines with non-ascii characters in the
     document.


  Checking nits according to https://www.ietf.org/id-info/checklist :
  ----------------------------------------------------------------------------

  ** The document seems to lack a Security Considerations section.

  ** There are 82 instances of too long lines in the document, the longest
     one being 4 characters in excess of 72.


  Miscellaneous warnings:
  ----------------------------------------------------------------------------

  -- The document date (5 June 2026) is 4 days in the past.  Is this
     intentional?


  Checking references for intended status: Informational
  ----------------------------------------------------------------------------

  == Unused Reference: 'ABCH20' is defined on line 1115, but no explicit
     reference was found in the text

  == Unused Reference: 'Abebe19' is defined on line 1119, but no explicit
     reference was found in the text

  == Unused Reference: 'Abebe21' is defined on line 1126, but no explicit
     reference was found in the text

  == Unused Reference: 'BSN22' is defined on line 1131, but no explicit
     reference was found in the text

  == Unused Reference: 'BVGC20' is defined on line 1136, but no explicit
     reference was found in the text

  == Unused Reference: 'CDE23' is defined on line 1141, but no explicit
     reference was found in the text

  == Unused Reference: 'Clar88' is defined on line 1147, but no explicit
     reference was found in the text

  == Unused Reference: 'Gray81' is defined on line 1151, but no explicit
     reference was found in the text

  == Unused Reference: 'Herl19' is defined on line 1156, but no explicit
     reference was found in the text

  == Unused Reference: 'HLP19' is defined on line 1161, but no explicit
     reference was found in the text

  == Unused Reference: 'HS2019' is defined on line 1166, but no explicit
     reference was found in the text

  == Unused Reference: 'HTLC21' is defined on line 1172, but no explicit
     reference was found in the text

  == Unused Reference: 'IDevID' is defined on line 1175, but no explicit
     reference was found in the text

  == Unused Reference: 'SRC84' is defined on line 1181, but no explicit
     reference was found in the text

  == Outdated reference: A later version (-09) exists of
     draft-richardson-t2trg-idevid-considerations-01

