#### Forms

**Getting a Form.**

The URL to fetch a form is part of the `action` serialization. In a case
when no form is referenced, the action does not require any attributes
to be performed.

Resource including an action with a Form:

    {
      "href" : "Ref(self)",
      "id" : Integer,
      "name" : "resource human name",
      "actions": [
        {
        "name    : "edit",
        "method" : "post",
        "form"   : { "href" : "https://hostname/vms?form_for=edit" },
        "href"   : "URL"
        }
      ]
    }

    GET /api/vms?form_for=edit HTTP/1.1

Example of a Form:

    {
      "required" : [ "name", "host" ],
      "optional" : [ "description" ]
      "internal" : [ "power_state", "created_on"]
    }

The following describes the semantics of the attribute identifiers:

  - **required** - These attributes must be specified for the action to
    be carried out.

  - **optional** - These are optional attributes, which may be specified
    and processed by the action. These may be shown in a UI but not
    enforced.

  - **internal** - It is not necessary to define these, but they are
    required for a UI form to show and extended a form with more
    attributes than the required and optional identifiers permit. This
    identifier shows what attributes are system managed and not
    modifiable by the REST client.
