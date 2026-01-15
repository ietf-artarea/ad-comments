See https://mailarchive.ietf.org/arch/msg/art/eGCe7jxcEquw_k1tX5e9s-seOzs/

## Discuss worthy

### Change controller

```
The "Change Controller" entry should be removed.
```

Why? These registries were established with the IETF as the change
controller.

The registration policy is Spec Required with a call out per rfc9605:

```
Recommended: Whether support for this cipher suite is recommended by the
IETF. Valid values are "Y", "N", and "D" as described in Section 17.1 of
[MLS-PROTO]. The default value of the "Recommended" column is "N". Setting
the Recommended item to "Y" or "D", or changing an item whose current value
is "Y" or "D", requires Standards Action [RFC8126].
```

In my reading, IETF remains the change controller regardless of the column
given the note about standards action.

What motivated the decision to remove the change controller column?

## Comments

### auth subkey?

```
   *  enc_key: The encryption subkey produced by the derive_subkeys()
      algorithm

   *  auth_key: The encryption subkey produced by the derive_subkeys()
      algorithm
```

### Why typically?

```
   *  Nt: The overhead in bytes of the encryption algorithm (typically
      the size of a "tag" that is added to the plaintext)
```

In which cases is this not the size of the tag? Why the optionality here?

