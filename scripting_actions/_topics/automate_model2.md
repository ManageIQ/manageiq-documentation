### Automate Model

The Automate model is arranged to provide an object oriented hierarchy
to control automation functions. The model uses the following
organizational units arranged in a hierarchy:

  - **Datastore** - The main organization unit that stores the entire
    model.

  - **Domains** - Domains act as collection of automation functions.
    Functions are executed depending on the order of Domain priority,
    which means a function in a Domain with a higher priority overrides
    the same functions specified in a lower-priority Domain. This allows
    {{ site.data.product.title_short }} to specify a core Domain (ManageIQ) but allow users
    to override automate functions with custom Domains. Each Domain
    contains a set of Namespaces.

  - **Namespaces** - Containers that organize and categorize functions
    of the model. Namespaces can contain child Namespaces as well as
    Classes.

  - **Classes** - Templates for a specific function of the model. Each
    Class uses a Schema to apply to Instances to populate with default
    values. Each class also can contain a set of methods.

  - **Instances** - An instance is a version of a class populated with
    initial configuration data. An instance can include a collection of
    any number of attributes, calls to methods, and relationships.

  - **Methods** - Methods are functions within the model. Methods use
    Ruby code to execute various operations needed for a Class.

{{ site.data.product.title_short }} contains a preconfigured Domain for users:

  - **ManageIQ** - The core domain for {{ site.data.product.title_short }} Automate
    operations. This domain is locked with the following Namespaces:

      - **Cloud** - General cloud instance lifecycle from provisioning,
        retirement, methods, email.

      - **Control** - Control contains email alerts for policy controls.

      - **Infrastructure** - General infrastructure VM lifecycle from
        provisioning, retirement, methods, email.

      - **Integration** - Used to interface with systems outside of
        {{ site.data.product.title_short }}. Use this namespace to integrate
        with additional systems.

      - **Service** - Service lifecycle from provisioning, retirement,
        methods, email.

      - **System** - System contains classes that can provide the start
        points for all {{ site.data.product.title_short }} Automate activities.

You can copy classes and instances from locked Domains into your own
custom domains.

**Note:**

Changing the existing classes or instances shipped with the product is
not recommended because this may hinder the operation of
{{ site.data.product.title_short }}. You can link to these methods using relationships.

To reset the Automate model to default settings, navigate to
**Automate > Import/Export** and click the **Reset** option.
