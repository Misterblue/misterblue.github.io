---
layout: page
style: vircadia
title: "Project Apollo API Research"
---
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
