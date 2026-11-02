# Andy Newton, ART AD, AD evaluation comments for draft-ietf-calext-jscalendar-icalendar-28 
CC @anewtion1998

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-calext-jscalendar-icalendar-28.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

I have found nothing major, but there are a fair number of nits. Is it possible to address these before moving forward to IETF Last Call?
I removed id-nits checks I know don't apply.

## Comments

### Figure 4

Is this suppose to be valid JSON? It looks to be missing some commas and outter brackets.

314	   "title": "hello"
315	   "@type": "Event",
316	   "title": "hello"
317	   {
318	     "@type": "Event",
319	     "title": "hello",
320	     "start": "2006-01-02T03:04:05",
321	     "timeZone": "Etc/UTC",
322	     "uid": "CC0A494A-6E07-4827-8294-0752DD1ECFA4",
323	     "updated": "2006-01-02T03:04:05Z"
324	   }
325	   {
326	     "@type": "Group",
327	     "version": "2.0",
328	     "entries": [
329	       {
330	         "@type": "Event",
331	         "title": "hello",
332	         "start": "2006-01-02T03:04:05",
333	         "timeZone": "Etc/UTC",
334	         "uid": "CC0A494A-6E07-4827-8294-0752DD1ECFA4",
335	         "updated": "2006-01-02T03:04:05Z"
336	       }
337	     ]
338	   }


## Nits

Can these be addressed? There may not be anything that can be done about the long lines because of the tables.

idnits 2.17.1 

draft-ietf-calext-jscalendar-icalendar-28.txt:

  Checking boilerplate required by RFC 5378 and the IETF Trust (see
  https://trustee.ietf.org/license-info):
  ----------------------------------------------------------------------------

     No issues found here.

  Checking nits according to https://www.ietf.org/id-info/1id-guidelines.txt:
  ----------------------------------------------------------------------------

  == There are 2 instances of lines with non-ascii characters in the document.


  Checking nits according to https://www.ietf.org/id-info/checklist :
  ----------------------------------------------------------------------------

  ** There are 547 instances of too long lines in the document, the longest
     one being 76 characters in excess of 72.

  == There are 14 instances of lines with non-RFC6890-compliant IPv4
     addresses in the document.  If these are example addresses, they should
     be changed.


  Miscellaneous warnings:
  ----------------------------------------------------------------------------

  == Line 4603 has weird spacing: '...ty Name  compo...'

  == Line 4607 has weird spacing: '...d Usage  commo...'

  == Line 4609 has weird spacing: '...er-User  no...'

  == Line 4612 has weird spacing: '...ty Name  conve...'

  == Line 4616 has weird spacing: '...d Usage  commo...'

  == (21 more instances...)


  Checking references for intended status: Proposed Standard
  ----------------------------------------------------------------------------

     (See RFCs 3967 and 4897 for information about using normative references
     to lower-maturity documents in RFCs)

  == Missing Reference: 'ICalProperty' is mentioned on line 4613, but not
     defined

  -- Possible downref: Non-RFC (?) normative reference: ref. 'TZDB'

  == Outdated reference: A later version (-08) exists of
     draft-ietf-calext-icalendar-jscalendar-extensions-06

  == Outdated reference: A later version (-22) exists of
     draft-ietf-calext-jscalendarbis-20

  == Outdated reference: A later version (-32) exists of
     draft-ietf-jmap-calendars-28


     Summary: 1 error (**), 0 flaws (~~), 12 warnings (==), 4 comments (--).

     Run idnits with the --verbose option for more detailed information about
     the items above.

--------------------------------------------------------------------------------
