## Specification

### HTTP Basics

{% include_relative _topics/rest_api_entry_point.md %}

{% include_relative _topics/supported_content_types.md %}

{% include_relative _topics/url_paths.md %}

{% include_relative _topics/methods_and_related_urls.md %}

{% include_relative _topics/updating_resources.md %}

{% include_relative _topics/modifying_resource_attributes.md %}

{% include_relative _topics/return_codes.md %}

{% include_relative _topics/crud_examples.md %}

### Authentication

There are two methods of authentication for the {{ site.data.product.title }} REST
API:

  - **Basic Authentication**: The user and password credentials are
    passed in with each HTTP request.

  - **Token based Authentication**: The client requests a token for the
    username/password credentials specified. Then the token is used in
    lieu of the username/password for each subsequent API call.

{% include_relative _topics/using_basic_authentication.md %}

{% include_relative _topics/using_authentication_tokens.md %}

### JSON Specification

The API uses JSON throughout; the Content-Type for all requests and
responses is `application/json`.

As is general practice with REST, clients should not make assumptions
about the server’s URL space. Clients are expected to discover all URL’s
by navigating the API. To keep this document readable, we still mention
specific URL’s, generally in the form of an absolute path. Clients
should not use these, or assume that the actual URL structure follows
these examples, and instead use discovered URL’s. Any client should
start its discovery with the API entry point, here denoted with `/api`.

{% include_relative _topics/basic_types.md %}

{% include_relative _topics/common_attributes_and_actions.md %}

{% include_relative _topics/collections4.md %}

{% include_relative _topics/actions4.md %}

{% include_relative _topics/forms1.md %}

### Query Specification

This specification identifies the controls available when querying
collections.

{% include_relative _topics/control_attributes.md %}

{% include_relative _topics/filtering.md %}

{% include_relative _topics/expanding_collections1.md %}
