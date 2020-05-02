---
layout: page
style: vircadia
title: "Project Apollo API Research"
---
<!--
<div id="herbal-toc">
  <ol>
    <li><a href="#raguos-module-based-spaceserver-frontend-for-opensimulator">Introduction</a></li>
      <ol>
        <li><a href="#choice-of-region-modules">Choice of Region Modules</a></li>
      </ol>
    <li><a href="#loden">Loden</a></li>
      <ol>
        <li><a href="#region-content-layers">Region Content Layers</a></li>
          <ol>
            <li><a href="#static">Static Layer</a></li>
            <li><a href="#dynamic">Dynamic Layer</a></li>
            <li><a href="#actors">Actors Layer</a></li>
            <li><a href="#editing">Editing Layer</a></li>
          </ol>
        <li><a href="#level-of-detail-computation">Level of Detail Computation</a></li>
        <li><a href="#division-hash">Division Hash</a></li>
        <li><a href="#texture-simplification">Texture Simplificiation</a></li>
        <li><a href="#asset-storage-and-access">Asset Storage and Access</a></li>
        <li><a href="#region-description-assets">Region Description Assets</a></li>
      </ol>
    <li><a href="#raguos">RaguOS</a></li>
      <ol>
        <li><a href="#editing-mode">Editing Mode</a></li>
      </ol>
    <li><a href="#revision-history">Revision History</a></li>
    <li><a href="#legal-stuff">Legal Stuff</a></li>
  </ol>
</div>
-->

# Vircadia/Project Apollo API Research

The [Vircadia] project needs a server infrastructure.
This project is [Project Apollo].

This article is my progress in reverse engineering the API used by
the Interface to talk to the servers.

The methodology as been to grep all the Interface sources
using ```find . -type f -print0 | xargs -0 grep v1 | grep api```
and then do some cleanup to remove some libraries.
The [cleaned up and organized output is here].

The from the Interface to the services is a REST interface.
Marcus Llewellyn sent me an initial [Swagger]
description of the [service API calls].
The work I'm putting in here is to verify all the API functions
and look for various authentication and data requirements.
My goal is to complete the above beginning and potentially
complete a [Swagger] definition so I can do code generation
for a complete service interface in whatever scalable
service infrastructure is chosen.

This is not the most efficient way of doing this but
it will be good for me to get into the code.
It will be a learning experience.

<pre>

/api/v1/domains/{metaverse.id}
/api/domains/{metaverse.id}    (?? see note below)
    domain-server/resources/web/wizard/js/wizard.js
        GET expects 'domain.default_place_name' to updatePlaceNameLink(domain.default_place_name)
            or 'domain.name' ("Temporty name") to updatePlaceNameLink(domain.name)
            or 'domain.network_address'
                if 'domain.network_port' != 40102 then
                    updatePlaceNameLink(domain.network_address)
                else updatePlaceNameLink(domain.network_address + ':' + domain.network_port
        (same logic in domain-server/resources/settings/js/settings.js in 'getShareName()')
        (the JavaScript logic is an intertwined mess of app logic and presentation)
    domain-server/resources/settings/js/settings.js
        domain.owner_places
        domain.label
    domain-server/resources/web/js/shared.js
        'getDomainFromAPI' references '/api/domains/{metaverse.id}' to get above data
    domain-server/resources/web/js/shared.js
        GET 'domain': {'cloud_domain': boolean }    // returned by isCloudDomain()
    domain-server/src/DomainServer.cpp
        PUT to do a domain update
            {
                'version': BuildInfo::VERSION,
                'protocol': protocolVersionsSignatureBase64(),
                'network_address': networkAddress,
                'automatic_networking': string,
                'restricted': ifAccessRestricted,
                'api_key':  suppliedIfTemporaryDomain
                'heart_beat': numberOfUsers??
            }
    libraries/networking/src/AddressManager.cpp

/api/v1/domains/{metaverse.id}/public_key

METAVERSE_URL/api/metaverse_info
    domain-server/resources/web/js/shared.js
        GET in function getMetaverseUrl() returns 'metaverse_url'

METAVERSE_URL/api/v1/domains/temporary
    domain-server/resources/web/js/shared.js
        GET expects 'domain.id'
    domain-server/src/DomainServer.cpp
        expects 'domain.id', 'domain.name', 'domain.api_key'

api/v1/transactions
    domain-server/src/DomainServer.cpp
        GET expects 'transaction.id' (UUID), 'transaction.destination_wallet_id',
                    'transaction.amount'
        does one request for each "pending assignment credit"

/api/v1/domains/{id}
    scripts/tutorials/getDomainMetadata.js
        'domain' has a lot of info in it (metadata)

/api/v1/domains/{id}/ice_server_address
    domain-server/src/DomainServer.cpp
        PUT to update ICE server address
            {
                'ice_server_address': '0.0.0.0' or addressAsString,
                'api_key': APIkeyIfTemporaryDomain
            }
            'domain': "aboveInfoAsJSONString"
                (there is an extra toJson() for unknown reasons)

/api/v1/user/places/{placeID}
/api/v1/user/places/{placeName}
    scripts/tutorials/getDomainMetadata.js
        'place.domain.id'
    scripts/system/interstitialPage.js
        GET
            { 'place': {
                'description': text
                }
            }
    libraries/networking/src/AddressManager.h

/api/v1/user/profile
    libraries/networking/src/AccountManager.cpp
        adds 'Authorization:' header token
        GET
            {
                'user': {
                    'username': name,
                    'xmpp_password': pwString,
                    'discourse_api_key': key,
                    'wallet_id': id

                }
            }

/api/v1/user/locker
    libraries/networking/src/AccountManager.cpp
        adds 'Authorization:' header token
        GET 
            {
                'lastChangeTimestamp':
                'homeLocation':
            }

/api/v1/user/public_key
    libraries/networking/src/AccountManager.cpp
    PUT
        header: 'form-data; name="public_key"; filename="public_key"'
        header: 'form-data; name="api_key"'
    Uses this URL or one below depending if 'domainID' is null or not
/api/v1/domains/{domainID}/public_key
    libraries/networking/src/AccountManager.cpp
    PUT



/api/v1/commerce/available_updates?per_page=10
    scripts/system/commerce/wallet.js

/api/v1/commerce/history?per_page=10
    scripts/system/commerce/wallet.js

/api/v1/commerce/history?since=sinceLastPollSeconds
                        &page=1
                        &per_page=1000 (with note to say gotta get them all)
    server-console/src/modules/hf-notifications.js
        does GET polling to generate notifications

/api/v1/commerce/available_updates?since=sinceLastPollSeconds
                        &page=1
                        &per_page=1000 (with note to say gotta get them all)
    server-console/src/modules/hf-notifications.js
        does GET polling to generate notifications
        does second fetch without the 'since' but adds
                'auth': 'bearer': token to request.get()

/api/v1/commerce/proof_of_purchase_status/location
    libraries/entities/src/EntityTree.cpp
        PUT? {  // part of certificate "validation"
            'certificate_id': certificate
        }

/api/v1/commerce/proof_of_purchase_status/transfer
    libraries/entities/src/EntityTree.cpp
        PUT? {  // part of certificate "validation"
            'certificate_id': certificate
        }
        response: {
            'invalid_reason': invalidIfThisIsNonEmpty,
            'transfer_status': checkedForStringFailed,
            'transfer_recipient_key': key
        }

/api/v1/commerce/marketplace_key
    libraries/entities/src/EntityItem.cpp
        GET
            {
                'public_key': marketplacePublicKey
        

/api/v1/user/connection_request
    scripts/system/makeUserConnection.js:
        DELETE to endHandshake()
        POST
            { 'user_connection_request': {
                    'node_id': MyAvatar.sessionUUID,
                    'proposed_node_id': id
                }
            }
        GET
            { connection: {
                'username': username,
                'new_connection': booleanTrueIfNewConnectionOtherwiseAlreadyConnected
                }
            }

/api/v1/user/connections/{connectionUserName}
    scripts/system/pal.js
        DELETE to "removeConnection"

/api/v1/user/channel_user?email=email
                    &username=username
                    &password=pw
    launchers/qt/src/SignupRequest.cpp
        adds ContentType: application/x-www-form-urlencoded
        PUT
            {
                'error': 'no_such_email'
                        'user_profile_already_completed'
                        'bad_username'
                        'existing_username'
                        'bad_password'
            }
            


/api/v1/users/{accountName}/location
    scripts/system/makeUserConnection.js:
        'location.node_id' expecting it to be equal to 'MyAvatar.sessionUUID'
    libraries/networking/src/AddressManager.cpp

/api/v1/users?status=online
https://metaverse.highfidelity.com/api/v1/users?status=online
https://metaverse.highfidelity.com/api/v1/users?status=online&filter=friends
    scripts/system/html/users.html
        GET
            { 'users': [
                    {
                        'username': userName,
                        'location': {
                            'root': {
                                'name': locationName
                            }
                        }
                    },
                    ...
                ]
            }

/api/v1/users?per_page=400&
/api/v1/users?filter=connections
/api/v1/users?filter=connections
                &status=online
                &page=1
                &per_page=MAX_NOTIFICATION_ITEMS
/api/v1/users?search=specificUserName
    scripts/system/libraries/connectionUtils.js
        part of 'getAvailableConnections()'
        GET
            { 'users': [
                    {
                        'username': userName,
                        'connection': string,
                        'images': {
                            'thumbnail': url
                        },
                        'location': {
                            'node_id': usedAsSessionId,
                            'root': {
                                'name': locationName
                            },
                            'domain': {     // seems to expect either 'root' or 'domain'
                                'name': locationName
                            }
                        }
                    },
                    ...
                ]
            }
    scripts/system/pal.js
    server-console/src/modules/hf-notifications.js
        adds 'auth', 'bearer': token to JavaScript request.get()
        does polling to generate notifications about new users
        GET
            { 'users': [
                {
                    'username': userName,
                ]
            }



/api/v1/user/friends
    scripts/system/pal.js
        POST    // to "addFriend"
            {
                'username': friendUserName
            }

/api/v1/user/friends/{friendUserName}
    scripts/system/pal.js
        DELETE to "removeFriend"


/api/v1/user_stories/{story_id}
    scripts/system/snapshot.js
        GET
            {
                'user_story': {
                    'path': storyPath,
                    'place_name': storyPlaceName,
                    'thumbnail_url': storyThumbnailUrl,
                    'details': {
                        'sharable_url': storySharableUrl,
                        'image_url': storyImageUrl
                    }
                }
            }

/api/v1/user_stories
    scripts/system/snapshot.js
        POST
            { 'user_story': {
                'audience: 'for_connections',   // part of "BlastToConnections"
                'action': 'announcement',
                'path': storyPath,
                'place_name': storyPlaceName,
                'thumbnail_url': storyThumbnailUrl
                // There is comment that "for historical reasons" the server doesn't
                //    take nested JSON objects so the 'details' contents are stringified
                'details': {
                    'sharable_url': storySharableUrl,
                    'image_url': storyImageUrl
                    }
                }
            }


/api/v1/user_stories?include_actions=announcement
                    &restriction=open,hifi
                &require_online=true&protocol={protocolSignature}&per_page=10
    scripts/system/tablet-goto.js
        GET

/api/v1/user_stories?since=sinceSeconds
                    &include_actions=announcement
                    &restriction=open,hifi
                    &require_online=true
                    &per_page=MAX_NOTIFICATION_ITEMS
    server-console/src/modules/hf-notifications.js
        GET
            does above GET then immediately does another
            /api/v1/user_stories?now="new Date().toISOString()"
                                &include_actions=announcement
                                &restriction=open,hifi
                                &require_online=true
                                &per_page=MAX_NOTIFICATION_ITEMS
            adds 'auth'=token to JavaScript request()
            { 'user_stories': [
                { 'place_name': storyPlaceName,
                    ...
                }
            ]
            }
            


/api/v1/user_activities
    libraries/networking/src/UserActivityLogger.h
        POST
            'form-data; name="action_name"' actionString
            'form-data; name="elapsed_ms"'  _timer.elapsed()
            'form-data; name="action_details"' jsonString
        actions:
            launch
                version
                previousSessionCrashed
                previousSessinRuntime
            insufficient_gl
                glData
            changed_display_name
                display_name
            changed_model
                type_of_model
                model_url
            changed_domain
                domain_url
            connected_devices
                type_of_device
                device_name
            landed_script
                script_name
            went_to
                trigger
                    UserINput, Back, Forward, StartupFromSettings, Suggestions
                destination_type
                destination_name

</pre>

## Legal stuff

The contents if this page are licensed under the 
[Creative Commons Attribution-NonCommercial 4.0 International]
license.

[Vircadia]: https://vircadia.com/
[Project Apollo]: https://github.com/kasenvr/project-apollo
[cleaned up and organized output is here]: ./CleanedUpURLs.html
[Swagger]: https://swagger.io/
[service API calls]: https://hifimetaverseapi.azurewebsites.net/index.html
[BSD License]: http://opensource.org/licenses/BSD-3-Clause
[MIT License]: http://opensource.org/licenses/MIT
[Apache License]: http://opensource.org/licenses/Apache-2.0
[Creative Commons Attribution-NonCommercial 4.0 International]: http://creativecommons.org/licenses/by-nc/4.0/

<!-- vim: ts=2 sw=2 et ai
-->
