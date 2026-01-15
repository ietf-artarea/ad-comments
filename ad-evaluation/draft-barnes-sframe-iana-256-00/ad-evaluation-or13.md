Hi Emad & ART List,

Please let me know if you plan to make any changes to the draft based on
the AD Evaluation.
I also welcome comments from the ART List on this topic, in case you
disagree with points I raised in my AD Evaluation or have other comments.
After we determine if there will be another draft version or not, I will
await that new version, or progress the document on your behalf.

See also this process related statement:

https://datatracker.ietf.org/doc/statement-iesg-guidance-on-area-director-sponsoring-of-documents-20070320/

I would also appreciate a Document Shepherd Volunteer for this document, if
anyone is willing to serve in that role.

Regards,

OS, ART AD

On Wed, Dec 3, 2025 at 12:36 PM Emad Omara <eomara@apple.com> wrote:

> Hi Orie,
>
> What are the next steps here to close this?
>
> Emad
>
> > On Oct 31, 2025, at 11:57 AM, Orie <orie@or13.io> wrote:
> >
> >
> > Hi,
> >
> > I'm AD Sponsoring this draft.
> >
> > Since the sframe list is no longer active I have set the art area list
> as the discussion venue.
> >
> > Here is my AD Evaluation:
> >
> > ## Discuss worthy
> >
> > ### Change controller
> >
> > ```
> > The "Change Controller" entry should be removed.
> > ```
> >
> > Why? These registries were established with the IETF as the change
> controller.
> >
> > The registration policy is Spec Required with a call out per rfc9605:
> >
> > ```
> > Recommended: Whether support for this cipher suite is recommended by the
> IETF. Valid values are "Y", "N", and "D" as described in Section 17.1 of
> [MLS-PROTO]. The default value of the "Recommended" column is "N". Setting
> the Recommended item to "Y" or "D", or changing an item whose current value
> is "Y" or "D", requires Standards Action [RFC8126].
> > ```
> >
> > In my reading, IETF remains the change controller regardless of the
> column given the note about standards action.
> >
> > What motivated the decision to remove the change controller column?
> >
> > ## Comments
> >
> > ### auth subkey?
> >
> > ```
> >    *  enc_key: The encryption subkey produced by the derive_subkeys()
> >       algorithm
> >
> >    *  auth_key: The encryption subkey produced by the derive_subkeys()
> >       algorithm
> > ```
> >
> > ### Why typically?
> >
> > ```
> >    *  Nt: The overhead in bytes of the encryption algorithm (typically
> >       the size of a "tag" that is added to the plaintext)
> > ```
> >
> > In which cases is this not the size of the tag? Why the optionality here?
> >
> >
> > --
> >
> > I'm onsite at IETF 124 in case you want to discuss in higher bandwidth,
> but please answer these questions on list : )
> >
> > Regards,
> >
> > OS, ART AD
>
>