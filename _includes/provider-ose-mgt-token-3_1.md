Run the following to obtain the token needed to add an OpenShift Enterprise 3.1 provider:

1. Obtain the `management` service account token name:

        # oc describe sa -n management-infra management-admin
        ...
        Tokens:  management-admin-token-0f3fh
                 management-admin-token-q7a87

2. Select and describe one of the tokens to retrieve the full token output, replacing `management-admin-token-0f3fh` with the name of your token:

        # oc describe secret -n management-infra management-admin-token-0f3fh
        ...
        Data
        ====
        token:  eyJhbGciOiJSUzI1NiI...
