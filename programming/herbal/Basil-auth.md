---
layout: page
style: herbal3d
title: "Herbal3D: Authentiction/Authorization Handling for Basil"
---
# Authentication/Authorization Handling for Basil

Basil does not handle authentication (logging in a user) and it only handles
authorization to access resources by passing around bearer tokens -- tokens
are given to Basil who passes them to resource servers.

Most of the bearer tokens used are [JWT] encoded tokens.

The steps are:

- The user logs in somewhere and gets a user authentication token
- This user authentication token is passed to Basil as `UserAuth`
- Basil connects to the SpaceServer passing `UserAuth` in a `SpaceServer.OpenConnection()` request
- The SpaceServer verifies `UserAuth` and replies with a `SessionAuth` token which Basil will use in later requests to the SpaceServer
- Basil also passes `ClientAuth` in the `SpaceServer.OpenConnection()` request which the SpaceServer will use as authorization for requests it makes to the client

## UserAuth Passed to Basil

Basil is invoked with a Base64 encoded JSON string. This string includes an 'auth'
section which contains at least:

```javascript
{
    "auth": {
        "SessionKey": "01234567890123456789",
        "UserAuth": "012345678901234567890123456789"
    }
}
```

where `SessionKey` is a string that uniquely identifies this Basil session
and `UserAuth` is a token from the authentication service that Basil can
pass in server to authenticate the user and request a session.

Both of these strings come from the authentication service and their interpretation
and representation is opaque to Basil.
`UserAuth` will most commonly be a JWT token generated by some login or
[OAuth2] service.

This `SessionKey` is an identifier from the authentication service or the
overall user control application. The `SessionKey` will be sent from Basil to
multiple SpaceServer services and can be used to group the multiple connections.

## Basil Connecting to a SpaceServer

The JSON encoded invocation parameter string also includes a `comm` section which
gives the URL and service type for Basil to connect to. If the service is a
SpaceServer, Basil will do a `SpaceServer.OpenConnection()` request. The "Auth" parameter
passed in the `SpaceServer.OpenConnection()` request will have the contents:

```javascript
{
    "accessProperties": {
        "SessionKey": "01234567890123456789",
        "Auth": "012345678901234567890123456789",
        "ClientAuth": "012345678900123456789"
    }
}
```

where `SessionKey` and `Auth` contain the values passed to Basil by the
authentication service, and `ClientAuth` is an authentication token generated by
Basil an passed to the SpaceServer. The SpaceServer will return this value when
making requests to the BasilServer to verify the request source.

The `SpaceServer.OpenSession()` request, if successful, returns properties that
point to asset services and tokens authorizing access to those services.
The properties are coded as:

```javascript
{
    "SessionKey": "01234567890123456789",
    "ConnectionKey": "65656565656565656",
    "SessionAuth": "98765432109876543210987654321",
}
```

where `SessionKey` is a replay of `SessionKey` from the invocation,
`SessionAuth` is a new authorization token that Basil will return in future
SpaceServer requests to authorize access,
`SessionAuthExpiration` is the date when the `SessionAuth` token will expire.

`SessionKey` identifies the Basil session while `ConnectionKey` is a unique identification
for the communication connection initiated through the `SpaceServer.OpenConnection()`
request. It can be used to manage flow control, authorization, and other communication
requirements.

`Services` is a JSON encoded string containing an array of one or more services that Basil
may need to access for this session. For each service, if an authorization token is needed,
it is supplied in an `Auth` and `AuthExpiration` value.

Authorization expiration dates are UTC times coded as [RFC3339] date strings.

## MakeConnection

A Basil renderer will receive `MakeConnecion()` requests that command it to connect
to another service.  The request includes the connection address, the service type, and
the authorization keys to access that service.

The properties sent in the `MakeConnection()` request will include at least:

```javascript
"Properties": {
    "Service": "SpaceServer",
    "TransportURL": "ServiceConnectionURL",
    "ServiceAuth": "9872039847983723974"
}
```

where `ServiceAuth` contains the authorization token that is returned by Basil in
the requests to the service.

The handshake is:

- Basil receives a authorization token for the service in the `MakeConnecion()` request;
- Basil uses that authorization token in the `SpaceServer.OpenSession()` request;
- The `SpaceServer.OpenSession()` request response includes a `SessionAuth` which is the authorization token that Basil will return to make future requests to that SpaceServer.

Since Basil will be talking to another service after this, the response to `MakeConnection()`
does not include any useful information other than an Exception of the connection is not allowed.

## Server Request Authorization

When accessing a server (BasilServer or SpaceServer), the request includes an 'auth'
field which includes at least:

```javascript
"accessProperties": {
    "Auth": "authorizationKey"
}
```

This provides the authorization key for the request to the server.

## JWT Information

((Description of the assertions coded into the JWTs))

## Token Renewal

((Use of SpaceServer.RenewSession() request to renew access tokens.))

The service description/authorization JSON string sent to Basil includes a name for that service.
This name is a unique identifier for that service/authorization association. That name is
used in the `SpaceServer.RenewSession()` request to get an updated authorization for the
service.


## Legal Stuff

This document is covered by [Creative Commons Attribution-NonCommercial 4.0 International].


[JWT]: https://jwt.io/
[JWT RFC]: https://tools.ietf.org/html/rfc7519
[RFC7519]: https://tools.ietf.org/html/rfc7519
[RFC3339]: https://tools.ietf.org/html/rfc3339
[OAuth2]: https://oauth.net/2/
[WGS 1984]: http://earth-info.nga.mil/GandG/publications/tr8350.2/tr8350_2.html
[OpenSimulator]: http://opensimulator.org/
[View Service]: http://loc-loc.net/
[Herbal System]: http://herbal3d.org/
[Basil Viewer]: http://basilviewer.org/
[Pesto]: http://misterblue.github.io/pesto/
[Ragu]: http://misterblue.github.io/ragu/
[BSD License]: http://opensource.org/licenses/BSD-3-Clause
[MIT License]: http://opensource.org/licenses/MIT
[Apache License]: http://opensource.org/licenses/Apache-2.0
[Creative Commons Attribution-NonCommercial 4.0 International]: http://creativecommons.org/licenses/by-nc/4.0/

<!-- vim: ts=2 sw=2 et ai
-->
