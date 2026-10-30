# Charles Eckel, ART AD, AD evaluation: draft-ietf-asdf-nipc-22
CC @eckelcu

* line numbers:
  - https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/draft-ietf-asdf-nipc-22.txt&submitcheck=True

* comment syntax:
  - https://github.com/mnot/ietf-comments/blob/main/format.md

Thanks to Lorenzo Corneo for the shepherd writeup.

## Comments

### [In]consistent terminology in Motivation

I found the overview in section 1.1 to be very helpful; however, the relationship of the text to the diagram is not entirely clear. The text uses the term operational network, while Figure 1 uses the term device network. The text uses the terms application-layer gateway and network gateway, whereas the figure title uses the term non-Internet-Connected Devices. It would be helpful if the terminology were consistent. Whatever terms are selected should be used consistently in the definition of the NIPC gateway and throughout the rest of the document. Note that Figure 2 labels the gateway "NIPC Gateway" but the text refers to it as "ALG". This usage should be consistent as well, perhaps by adding "ALG" to the label for the gateway.

### Wired vs. wireless AP

```
342	(D).  The applications, ALG, and AP reside on an IP network; the AP
343	provides a wireless or wired interface to the device.  Applications
```

but then

```
444	*  Access Point (AP): Network element with a radio interface
445	   communicating with devices.
```

Unclear whether an AP needs to have a radio/wireless interface

### SDF expansion is incorrect

```
369	*  SDF: Semantic Device Format, a standardized format to describe
```

RFC 9880 defines SDF as "Semantic Definition Format".

### Mandatory registration of extensions

The draft requires all extensions to be registered with IANA:

```
693	Extensions MUST use the "/extensions" path element.  To ensure
694	interoperability, extensions MUST be registered with IANA as defined
695	in Section 11.3.1.
```

```
3009	management).  To ensure interoperability and consistent security
3010	review, extensions MUST be registered with IANA as defined in
3011	Section 11.3.1.
```

```
3036	payloads, as well as their own query parameters.  Extensions must be
3037	IANA registered as defined in Section 11.3.1.
```

I believe the "must" above should be "MUST" as well.

The registry policy is Specification Required:

```
3945	The registration policy for this registry is Specification Required
3946	[RFC8126].
```

Read literally, a gateway offering any vendor-specific, deployment-specific, or experimental extension that has not been registered does not conform to this specification. Is that the intent? Registration has a clear benefit, but implementers often want private extensions, and a requirement that is widely ignored weakens the specification. If the intent is to not allow this, which appears to be the case, consider adding a statement such as the following:

```
A publicly available vendor specification satisfies Specification Required (Section 4.6 of RFC 8126), so private extensions can be registered with modest effort.
```

### Requirements language

There are many lowercase "must"/"should"/"recommended" statements that read as normative requirements (e.g., lines 726, 731, 735, 796, 911, 929, 933, 1490, 1504-1507, 1583, 1747, 2210-2213, and 3839-3852). Please review each and either capitalize it or rephrase it. 

Also, some uses of "MAY" are not permissions and most likely should not be normative, for example:

```
1706	event MAY be enabled only if the underlying protocol supports group
```

```
3807	Since the possession of a bearer token, Authorization token, or
3808	cookie MAY authorize the holder to perform NIPC Operations on
```

```
3839	*  Preventing automated attacks: It is recommended to limit the
3840	   number of requests that any particular application MAY make in a
```

### Extension response behavior is inconsistent

Section 2.6.4 says all extensions return 202 Accepted and are polled, while Section 5.2 says only long-running extensions SHOULD do so. Appendix D.6 (transmit) returns 200. Please align.

```
917	1.  Extensions: Extension APIs (see Section 5.2) execute compound
918	    operations and thus require the gateway to execute multiple NIPC
919	    operations.  On acceptance, the gateway returns 202 Accepted.
```

```
3039	Extensions MAY implement long-running operations (e.g., firmware
3040	updates, bulk actions).  For such operations, the server SHOULD
3041	respond with 202 Accepted and a Location header referencing a status
```

### Inconsistent certificate encodings

`brokerCACert` is "base64-encoded" in the prose (line 1274) but "PEM-encoded" in the CDDL (line 1344). `serverCACert` is RFC 7468 with newlines escaped. Please use one encoding and describe it consistently.

### Credentials returned in API responses

The data-app registration carries secrets (MQTT `password`, webhook/websocket `headers` containing authentication information). Sections 3.2.1-3.2.3 state that responses, including GET, are "identical to the request body", meaning secrets are echoed back to any client authorized to read the registration. Please consider not returning secret values (or returning them redacted), and discuss this in Security Considerations.

```
1408	Response:
1410	*  If successful, the response will be identical to the request body.
```

```
1441	Response:
1443	The response will be identical to the request body for the register
1444	data application API Section 3.2.1.
```

### Percent-encoding of SDF global names vs. allowReserved

Section 2.6.3 explains at length why SDF global names are carried in query parameters, and Section 4 requires them to be percent-encoded. The OpenAPI definition, however, sets `allowReserved: true` for `propertyName`, which tells clients *not* to percent-encode reserved characters. Some examples are also not encoded (e.g., line 2220 vs. Figure 19). Please make these consistent.

```
1492	the gateway will execute.  When carried in a URI, the SDF global name
1493	MUST be percent-encoded per Section 2.1 of [RFC3986].
```

```
4575	        allowReserved: true
```

### Multi-property read mechanism

Section 4.1.2 says that when several properties are read, the GET request body MUST contain the list:

```
1643	*  propertyName: The property to read.  This can be a single property
1644	   or multiple properties.  If multiple properties are provided, the
1645	   request body MUST contain an application/nipc+json payload with an
1646	   array of properties to read.
```

However, the URI template uses the explode modifier. Per RFC 6570, a list value expands to repeated query parameters (e.g., `?propertyName=a&propertyName=b`):

```
1633	Method: GET /devices/{id}/properties{?propertyName*}
```

The OpenAPI definition likewise models `propertyName` as a required array query parameter, and the GET operation defines no requestBody (unlike the PUT on the same path at line 4513):

```
4548	    get:
...
4562	      parameters:
...
4571	      - name: propertyName
4572	        in: query
4573	        description: Properties to be read
4574	        required: true
4575	        allowReserved: true
4576	        schema:
4577	          type: array
4578	          items:
4579	            type: string
...
4582	      responses:
```

Please pick one mechanism and align the prose, template, and OpenAPI.

### Multi-valued query parameters

Section 4.2.3 describes `instanceId` as a comma-separated list. However, the template uses the explode modifier, which under RFC 6570 expands a list to repeated parameters (e.g., `?instanceId=a&instanceId=b`) rather than a comma-separated list (`?instanceId=a,b`). The trigger APIs (lines 2315 and 2464) use `{?instanceId}`, which does produce a comma-separated list. Please use `{?instanceId}` here too, or change the prose to match.

```
1790	Method: GET /devices/{id}/events{?instanceId*}
```

```
1801	*  instanceId: a comma separated list of event instance IDs to filter
1802	   by (optional)
```

Lines 2326 and 2475 also say "event instance IDs" for the trigger APIs, where they should say "trigger instance IDs".

### Action status cannot report failure or output

`ActionStatus` is only `IN_PROGRESS` or `COMPLETED`. How does a client learn that an action failed after the 202 was returned, or get any action output? How long are action instances retained?

```
2089	ActionStatus = "IN_PROGRESS" / "COMPLETED"
```

### Extension path structure

Section 5.2 says the extension name follows `/extensions`, but every extension URI in the document puts the device ID first (`/extensions/{id}/bulk`). Section 2.5.1 also lists `/extensions` as a collection alongside `/devices` and `/groups`, but Section 2.5.3 lists `extensions` as an operation after `{id}`. Please clarify the intended path structure.

```
3033	Extensions must be defined under the /extensions path element.  The
3034	extension name is defined as a path parameter after the /extensions
3035	path element.  Extensions may define their own request and response
```

### Security Considerations gaps

Section 10 covers transport and token handling, but does not address threats specific to this API. Some to consider:

* Explicit connections: operations from multiple applications reuse an active explicit connection, but any authorized application can disconnect from the device (Section 4.5.4). It appears that could disrupt a sequence of operations another application is performing over that connection. Should disconnecting be restricted (e.g., to the application that created the connection), or should applications be notified when a connection they are using is torn down? Or does the gateway not allow the connection to be torn down if another client is using it?

* MQTT topics: when the gateway acts as broker (`mqttClient`), what prevents one data app from subscribing to another data app's topics (e.g., the `data-app/+/...` wildcard example at line 1728)?

* Triggers: an application authorized on device A can install a trigger that invokes an action on device B (or a group). What authorization check applies to the target action, and when (at creation time, at execution time, or both)? Nothing addresses trigger loops (an action on B whose event triggers an action on A, and so on).

* Privacy: published events can include MAC addresses, AP MAC addresses, RSSI, and LQI, which allow location tracking of devices and people. Section 7.1 briefly mentions topology. A privacy discussion is needed given the healthcare and workplace use cases in Section 1.1.

* Firmware update and file write extensions (Appendix D) seem likely to have security implications that are not discussed.

### TLS and HTTP references are outdated

Section 10.2 cites RFC 6125 (obsoleted by RFC 9525) and RFC 7525 (obsoleted by RFC 9325, BCP 195). Section 10.3 cites RFC 7230 (obsoleted by RFC 9110/9112). HTTP security considerations are now in Section 17 of RFC 9110. Also, given the UTA WG's work requiring TLS 1.3 for new protocols (draft-ietf-uta-require-tls13), please reconsider whether a new Standards Track protocol should mandate TLS 1.2 support rather than require TLS 1.3. "TLS/SSL server identity check" should just be "TLS server identity check".

```
3769	NIPC MUST run on top of a transport-layer security mechanism such as
3770	TLS.  When leveraging TLS, the NIPC gateway MUST support TLS 1.2
3771	[RFC5246] and TLS 1.3 [RFC8446] and MAY support additional transport-
3772	layer mechanisms.  When using TLS, the client MUST perform a TLS/SSL
3773	server identity check, per [RFC6125].  Implementation security
3774	considerations for TLS can be found in [RFC7525].
```

Also, the gateway is a TLS *client* toward webhooks, websockets, and external MQTT brokers. Please state the server identity check requirements for those connections too, including how `serverCACert`/`brokerCACert` are used.

### Credential storage guidance

The gateway must use the MQTT broker password and webhook/websocket headers to authenticate *outbound*, so it cannot store them hashed. Hashing is also not encryption. Please revise this text to distinguish credentials the gateway verifies (which can be hashed) from credentials it presents (which need protected storage).

```
3855	*  Storage and handling of sensitive data: Credentials MUST NOT be
3856	   stored in clear-text, but MUST be stored using an encrypted
3857	   protection mechanism (e.g., hashing).
```

### IANA: Designated expert guidance

The new registries are Specification Required, which includes designated expert review. Some requirements are stated for each registry, but explicit guidance for the designated expert is needed (Section 5.3 of RFC 8126). This matters particularly for the API extensions registry, where an OpenAPI model "must be reviewed by an expert" (line 3956).

### IANA: Appendix D.6 property extensions

```
8126	D.6.  NIPC API property extensions
8127	   <CODE BEGINS> file "Extension-Transmit.yaml"
8128	   =============== NOTE: '\' line wrapping per RFC 8792 ================

8130	   # yaml-language-server: $schema=https://json-schema.org/draft/2020-\
8131	                                                               12/schema
8132	   openapi: 3.0.3
8133	   info:
8134	     title: Non IP Device Control (NIPC) API properties extension
8135	     description: |-
8136	       Non IP Device Control (NIPC) API properties extension
```

Table 5 lists `/extensions/{id}/transmit` but not the "property extensions" of Appendix D.6. Appendix D.6 is actually the transmit extension (file `Extension-Transmit.yaml`, path `/extensions/{id}/transmit`). Are the "property extensions" section title and the "properties extension" in `info.title` and `description` meant to be "transmit extension"?

### IANA: Problem type registry

RFC 9457 already defines an "HTTP Problem Types" registry. Please explain why a separate NIPC registry is needed. If one is kept, the text requires the RFC 9457 Section 4.2 template, but Table 8 omits the Title and Recommended HTTP status code fields. Hosting type URIs under `https://www.iana.org/assignments/nipc-problem-types#...` should be confirmed with IANA. Also, `FailureResponse` in Section 2.6.4 makes `type`, `status`, `title`, and `detail` all mandatory and includes `about:blank` in the enumerated types, which is stricter than RFC 9457. Is that intended?

### Missing references

MQTT, WebSocket (RFC 6455), and OpenAPI are central to the specification but have no references. RFC 8792 is used for line wrapping throughout and should be an informative reference. Please also check whether the OAuth references (RFC 6749, 6750, 6819, 7521) and RFC 6265 really need to be normative.

### OpenAPI definitions

* The `license` is `TBD` in every OpenAPI model, and `termsOfService` points to `http://swagger.io/terms/`. Both fields are optional in OpenAPI 3.0. I suggest removing them from all models.

* `servers` uses `{gw_host}/nipc/draft-22`, which should be updated for publication. `info.title` ("Non IP Device Control") does not match the document title.

* `$ref` values point to files (`../NIPC.yaml`, `../protocolinfo/ProtocolInfo.yaml`) that do not correspond to the file names in the CODE BEGINS markers (`openapi.yml`, `ProtocolInfo.yaml`).

* The `yaml-language-server` comment references JSON Schema 2020-12, which corresponds to OpenAPI 3.1, but the models declare `openapi: 3.0.3`.

## Nits

### Commas for readability

I found the following sentence hard to parse. If I understand the intended meaning correctly, I believe the proposed version reads better.

CURRENT:

```
274	*  The gateway has access to a device object, that contains its
275	   identity, in the form of a unique UUID and any credentials & trust
276	   material required to communicate with the device.  Provisioning
```

PROPOSED:

```
274	*  The gateway has access to a device object that contains its
275	   identity, in the form of a unique UUID, and any credentials and trust
276	   material required to communicate with the device.  Provisioning
```

### Ampersands in prose

Use "and" instead of "&" in prose (e.g., lines 275, 582, 715, 1241, 1245).

### Consistent use of NIPC-Gateway

This occurs with and without the dash, and with and without a capital 'G' (e.g., lines 290, 314, 858, 2338 "NIPC GW", 2535 "an NIPC gateway"). Pick one format and use it consistently throughout the document.

### Non-ASCII characters

idnits flags 13 lines with non-ASCII characters (curly quotes and em dashes, e.g., lines 318, 495, 573-575, 693, 866, 891, 904). Consider replacing them with ASCII.

### Events typo

```
642	   An example of using an event API receiving an event that a button has
643	   been pressed.
```

s/API receiving/API is receiving

### Example values

* Table 2 (line 872) and several later examples use a `heartrate` namespace for a `thermostat` object.

* `"eGVzdB=="` (lines 1573, 1689) is not canonical base64.

* Section 8.3 checks the status of the `thermometer` `isPresent` event, but the response (line 3639) shows `heartrate` `fallDetected`.

### Copy-pasted figure captions

* Figures 8 and 9 (delete and update) are both captioned "response to an SDF model registration".

* The caption of Figure 24 says "explicit discovery of connections"; should this be "services"?

* Figure 27 is a request body but is captioned "Example service discovery response".

### Miscellaneous wording

```
1230	   the data-app supports.  These should be one of the following:
```

s/These should be/This is

```
2224	   defined on a devices that supports one protocol and triggers an
```

s/a devices/a device

```
2317	   Description: Get the installed triggers for a devices, or a specific
```

s/for a devices/for a device

```
3965	   |/extensions/{id}/bulk            |Bulk API   |Call       |Appendix |
3966	   |                                 |           |multiple   |D        |
3967	   |                                 |           |NIPC's in a|         |
3968	   |                                 |           |single     |         |
3969	   |                                 |           |request    |         |
```

s/Call multiple NIPC's/Invoke multiple NIPC operations

### Reference formatting

```
1424	      data application API Section 3.2.1.
```

and

```
1444	   data application API Section 3.2.1.
```

s/ Section 3.2.1/, per Section 3.2.1


```
2743	   protocol info object in section Section 4.5.1.  This is an array of
```

s/section Section/Section


### Nonexistent "properties" array

```
1582	*  If the Accept header is set to application/nipc+json, the response
1583	   must be an array with a status field set to 200 for each property
1584	   that was updated, or a problem type object for each property that
1585	   failed to update.  The "properties" array must be an array of
1586	   properties that were updated, each containing a property and a
1587	   value.
```

The CDDL defines only a status (or a FailureResponse) per item, with no "properties" member and no property or value:

```
1598	PropertyValueResponseArray = [* PropertyValueResponseArrayItem]
1600	PropertyValueResponseArrayItem = ( SuccessResponse // \
1601	                                                    FailureResponse )
1603	; Minimal success shape (may be extended)
1604	SuccessResponse = {
1605	  status: uint
1606	}
```

I believe the last sentence of the bullet (lines 1585-1587) should be deleted, or, if updated values are meant to be echoed, add them to `SuccessResponse` and the example.

### Broken inline lists

Dash lists are run together into paragraphs at lines 1654-1656, 1804-1807, and 2484-2488.

### Response vs. request body

Line 1661 describes the response, not the request body.

```
1660	*  If the Accept header is set to any other media type and a single
1661	   propertyName query parameter is provided, the request body MAY use
```

### Missing query parameter in template

```
1843	   Method: POST /groups/{id}/events
```

Should this be `POST /groups/{id}/events{?eventName}`?

### Cache descriptions differ

The description of "cached" in Section 4.5.2 (line 2720) differs from that in Section 4.5.3 (line 2851).

### Duplicated word

```
3050	In the appendix Appendix D, we have defined a few example extensions.
```
