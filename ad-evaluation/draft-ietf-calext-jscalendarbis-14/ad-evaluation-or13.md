# Orie Steele, ART AD, comments for draft-ietf-calext-jscalendarbis-14 
CC @OR13

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-calext-jscalendarbis-14.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

## Comments

### parent vs to be patched object

```
567	   *  If null, remove the property from the patched object.  If the key
568	      is not present in the parent, this a no-op.
```

I was suprised to see parent here, consider if there is a better term.
"parent" is defined later as:

```
621	      parent:  The linking object is a subpart of the linked object.
```

### calendars as bi-directional channels

I've heard that calendars can sometimes to be used as bi-directional channels, which attackers can use for C2. 

Noting the support for data URIs, I wonder if there should be any security considerations commenting on the use of calendars as bi-directional channels.


## Nits

### these/this

```
1295	   count: UnsignedInt (optional)
1296	      These are the number of occurrences at which to range-bound the
1297	      recurrence.  This MUST NOT be included if an until property is
1298	      specified.
```

The text says “These are the number of occurrences”. Since “count” is a single value, “This is the number of occurrences” would be slightly better; not a technical error.

same for "until".


### IANA registry names and columns

Consider this AI generated review of the current IANA registries vs this draft:

I checked the draft’s IANA instructions against the current [JSCalendar IANA registries](https://www.iana.org/assignments/jscalendar/). Registry names and column usage are correct there; the following fixes are needed in the draft so instructions match the actual column names and registry names.

**1. "Intended Status" → "Intended Usage"**

The registries use the column name **"Intended Usage"** (not "Intended Status"). The draft should say "Intended Usage" in:

- **8.2.3.1** (Obsoleted Properties): “IANA will change the **Intended Status** from …” → “Intended **Usage**”
- **8.2.3.2** (Reserved Properties): same change
- **8.3.2.1** (Obsoleted Types): same change

**2. JSCalendar Types template: "Intended Use" → "Intended Usage"**

Section 8.3.1 defines “Intended **Use**” for the JSCalendar Types registry. The IANA JSCalendar Types table uses **"Intended Usage"** (same as JSCalendar Properties). For consistency with the registry and with Section 8.2.2, the template should use **"Intended Usage"**.

**3. "JSCalendar Enum" → "JSCalendar Enum Values"**

The registry is named **"JSCalendar Enum Values"**. The draft should not call it “JSCalendar Enum” in:

- **8.4.1** (Registry Property Template): “to the 'JSCalendar **Enum**' registry” → “JSCalendar **Enum Values**”
- **8.4.2** (Registry Value Template): “in the JSCalendar **Enum** registry” → “JSCalendar **Enum Values**”

**4. Duplicate "Context:" in 8.4.3.3.4**

The heading for Section 8.4.3.3.4 reads “JSCalendar Enum Values for roles (Context: **Context:** Participant)”. The second “Context:” should be removed.

**5. Enum Values “Intended Use” vs “Intended Usage” (consistency)**

The draft adds an “**Intended Use**” column to the Enum Values value template (8.4.2) and uses “Intended Use” in 8.4.3.3.4. The JSCalendar Properties and JSCalendar Types registries both use **“Intended Usage”**. Consider using “Intended Usage” for this new column as well so all three registries use the same column name.

**Verified as correct**

- Registry names: “JSCalendar Properties”, “JSCalendar Types”, “JSCalendar Enum Values” match IANA.
- JSCalendar Properties columns: Property Name, Property Type, Property Context, Reference/Description, Intended Usage, Is Per-User, Change Controller — draft’s Added Properties (8.2.3.4) correctly use “Intended Usage” and “Is Per-User”.
- JSCalendar Types columns: Type Name, Reference/Description, Intended Usage, Change Controller — match IANA.
- Sub-registry naming pattern “JSCalendar Enum Values for &lt;property&gt; (Context: &lt;context&gt;)” matches IANA; the draft’s renames/removals are consistent with that pattern.

## Normative / informative references

**Obsolete normative reference: RFC 2445**

idnits reports "Obsolete normative reference: RFC 2445 (Obsoleted by RFC 5545)". The shepherd notes that both RFC 2445 and RFC 5545 are cited. Please confirm whether RFC 2445 is still required normatively (e.g., for a specific feature only in 2445) or whether it can be made informative / removed so that RFC 5545 is the single normative iCalendar core reference.


