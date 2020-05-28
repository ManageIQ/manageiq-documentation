#### Action Specification

The representation of each resource will only contain an action and its
URL if the current user is presently allowed to perform that action
against that resource. Actions will be contained in the `actions`
attribute of a resource; that attribute contains an array of action
definition, where each action definition has a rel, method and a href
attribute.

  - `name` attribute contains the action name

  - `method` attribute states the HTTP method that must be used in a
    client HTTP request in order to perform the given action (eg. GET,
    POST, PUT, DELETE)

  - `href` attribute contains the absolute URL that the HTTP request
    should be performed against

  - `form` is an optional attribute that references a JSON document
    which describes the resource attributes that can be provided in the
    message body when performing this action. This description indicates
    which of those attributes are mandatory and which are optional.

**Collection actions.**

The actions performed against a collection of resources, are in most
cases batch operations against multiple resources. The action request
must include an HTTP body with the action name and the list of resource
representations that the action will be performed against.

The resource representation might include the resource attributes as
they can change the way how the action is actually performed. In the
example below, the first resource is started with `enable_ipmi`
attribute, but the second resource omits this attribute which means the
default value will be used.

Sample JSON request body for collection action:

`POST /api/vms`

    {
      "action": "start",
      "resources" : [
        { "href" : "https://hostname/api/vms/1", "enable_ipmi" : "enabled", "initial_state" : "started" },
        { "href" : "https://hostname/api/vms/2" }
      ]
    }

Actions in collection:

    {
      "name" : "String",
      "count": String,
      "subcount": String,
      "resources": [ ... ],
      "actions": [
        {
        "name"   : "shutdown",
        "method" : "post",
        "href"   : "URL"
        },
        {
        "name"   : "restart",
        "method" : "post",
        "href"   : "URL"
        },
        {
        "name"   : "poweron",
        "method" : "post",
        "href"   : "URL"
        },
        {
        "name"   : "poweroff",
        "method" : "post",
        "href"   : "URL"
        },
        {
        "name"   : "suspend",
        "method" : "post",
        "href"   : "URL"
        },
        {
        "name"    : "edit",
        "method" : "post",
        "form"   : { "href" : "https://hostname/api/vms?form_for=add" },
        "href"   : "URL"
        },
        {
        "name"   : "destroy",
        "method" : "delete",
        "href"   : "URL"
        }
      ]
    }

**Resource actions.**

An action performed against a given resource is always described in the
body of the HTTP request. The HTTP body could contain a list of resource
attributes that dictate how the state of the receiving resource is to be
changed once the action is performed. At minimum the JSON document in
the message body must contain the name of the action to be performed.

In cases where no attributes are required to perform an action the HTTP
body will contain an empty JSON document, in which case default values
will be assigned to the corresponding attributes.

Sample JSON request body for resource action:

`POST /api/vms/123`

    {
      "action"   : "start",
      "resource" : { "enable_ipmi" : "enabled" }
    }

`POST /api/vms/321`

    {
      "action"   : "start",
      "resource" : {}
    }

Actions in a resource:

    {
      "href"  : "Ref(self)",
      "id"    : Integer,
      "name"  : "resource human name",
      "actions" : [
        {
        "name"   : "edit",
        "method" : "post",
        "form"   : { "href" : "https://hostname/api/vms?form_for=edit" },
        "href"   : "URL"
        }
      ]
    }
