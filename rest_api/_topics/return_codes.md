#### Return Codes

  - **200 OK** - The request has succeeded without errors, this code
    should be returned for example when retrieving a collection or a
    single resource.

  - **201 Created** - The request has been fulfilled and resulted in a
    **new resource being created**. The resource is available before
    this status code is returned. The response includes the HTTP body of
    the newly created resource.

  - **202 Accepted** - The request has been accepted for processing, but
    the processing has not been completed. Like, resource is not fully
    available yet. This status code is usually returned when the
    resource creation happens asynchronously. In this case the HTTP
    response includes a pointer to **monitor** or a **job** where the
    client can query to get the current status of the request and the
    estimate on when the request will be actually fulfilled.

  - **204 No Content** - The server has fulfilled the request but does
    not need to return an entity-body, and might want to return updated
    meta information. This HTTP response is commonly used for the
    `DELETE` requests, as the resource that was deleted does not exists
    anymore.

<!-- end list -->

  - **400 Bad Request** - The request could not be understood by the
    server due to malformed syntax. The client SHOULD NOT repeat the
    request without modifications. In REST API this status code should
    be returned to client when the client use the wrong combination of
    attributes, like expanding the non-existing collection, or using the
    pagination parameter incorrectly. Another use-case could be creating
    or performing actions on the resource, when the wrong JSON
    serialization of the resource or action is used.

  - **401 Unauthorized** - The request requires user authentication. The
    response MUST include a **Authenticate** header field containing a
    challenge applicable to the requested resource. If the request
    include **Authenticate** header, then this HTTP status code might
    indicate that the current user is **not authorized** to perform
    given action or to access given resource.

  - **403 Forbidden** - The server understood the request, but is
    refusing to fulfill it. Authorization will not help in this case.
    This HTTP status code might indicate that the action performed is
    not supported for this resource or collection.

  - **404 Not Found** - In this case, the server has not found anything
    that matches with the URL.

  - **415 Unsupported Media Type** - The server is refusing to service
    the request because the entity of the request is in a format not
    supported by the requested resource for the requested method. This
    error must be returned, when the client is explicitly asking for
    format other than JSON (application/json).

<!-- end list -->

  - **500 Internal Server Error** - The server encountered an unexpected
    condition which prevented it from fulfilling the request. This error
    code must be used when an exception is raised in the application and
    the exception has nothing to do with the client request.
