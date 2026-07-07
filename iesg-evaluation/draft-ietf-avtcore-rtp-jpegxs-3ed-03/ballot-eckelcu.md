# Charles Eckel, ART AD, comments for draft-ietf-avtcore-rtp-jpegxs-3ed-03 
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-avtcore-rtp-jpegxs-3ed-03.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

* "Handling Ballot Positions":
  - https://ietf.org/about/groups/iesg/statements/handling-ballot-positions/

## Comments

### Default value for fbblevel

The fbblevel parameter is listed as optional, but the text does not explicitly state the default behavior or value if the parameter is omitted in an SDP offer.

985        Optional parameters:
:
1007          fbblevel:  The JPEG XS frame buffer level [ISO21122-2] in use.

1009             Any white space Unicode character in the fbblevel name SHALL be
1010             omitted.  Examples of valid frame buffer levels are
1011             'Fbblev3bpp' or 'Fbblev12bpp'.

Would it be helpful to add a sentence to the fbblevel description such as, "If the parameter is not specified, it SHALL be assumed that the TDC coding mode is not used, or that the frame buffer level is zero."

I ask this in reference to the newly added fbblevel parameter, but I see there are other optional parameters for which no default behavior or value is specified.