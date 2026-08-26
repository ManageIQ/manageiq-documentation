## ServiceNow Builtin Methods

The following builtin methods provide integration with ServiceNow for embedded workflows. These methods allow you to interact with ServiceNow's CMDB, Incident Management, Service Catalog, and generic Table APIs.

### CMDB Methods

* `servicenow://cmdb/get_ci` - Get a Configuration Item by sys_id

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the CI to retrieve
  * `table` (optional) - CMDB table name, defaults to "cmdb_ci"

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://cmdb/query_cis` - Query Configuration Items with optional filters

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table` (optional) - CMDB table name, defaults to "cmdb_ci"
  * `query` (optional) - ServiceNow query string
  * `limit` (optional) - Maximum number of records to return
  * `offset` (optional) - Number of records to skip
  * `fields` (optional) - Comma-separated list of fields to return

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://cmdb/create_ci` - Create a new Configuration Item

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table` (optional) - CMDB table name, defaults to "cmdb_ci"
  * Additional parameters are passed as the CI data

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://cmdb/update_ci` - Update an existing Configuration Item

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the CI to update
  * `table` (optional) - CMDB table name, defaults to "cmdb_ci"
  * Additional parameters are passed as the update data

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://cmdb/delete_ci` - Delete a Configuration Item

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the CI to delete
  * `table` (optional) - CMDB table name, defaults to "cmdb_ci"

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://cmdb/get_ci_relationships` - Get CI relationships

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the CI

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://cmdb/create_ci_relationship` - Create a relationship between two Configuration Items

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `parent_sys_id` (required) - System ID of the parent CI
  * `child_sys_id` (required) - System ID of the child CI
  * `relationship_type` (required) - Type of relationship
  * `connection_strength` (optional) - Connection strength, defaults to "1"

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://cmdb/get_ci_classes` - Get available CI classes (types)

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `limit` (optional) - Maximum number of records to return

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

### Incident Management Methods

* `servicenow://incident/create_incident` - Create a new incident

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `short_description` (required) - Brief description of the incident
  * Additional parameters are passed as incident data (e.g., description, urgency, impact, assignment_group)

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://incident/get_incident` - Get an incident by sys_id

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the incident

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://incident/update_incident` - Update an existing incident

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the incident to update
  * Additional parameters are passed as the update data

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://incident/resolve_incident` - Resolve an incident

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the incident to resolve
  * `close_code` (optional) - Resolution code
  * `close_notes` (optional) - Resolution notes
  * `attributes` (optional) - Additional attributes to update

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://incident/close_incident` - Close an incident

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `sys_id` (required) - System ID of the incident to close
  * `close_code` (optional) - Close code
  * `close_notes` (optional) - Close notes
  * `attributes` (optional) - Additional attributes to update

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://incident/query_incidents` - Query incidents with optional filters

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `query` (optional) - ServiceNow query string
  * `limit` (optional) - Maximum number of records to return
  * `offset` (optional) - Number of records to skip
  * `fields` (optional) - Comma-separated list of fields to return

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

### Table API Methods

* `servicenow://table/list_tables` - List available tables

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `query` (optional) - ServiceNow query string to filter tables
  * `limit` (optional) - Maximum number of records to return
  * `offset` (optional) - Number of records to skip
  * `fields` (optional) - Comma-separated list of fields to return

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://table/query_records` - Query records from a table

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table_name` (required) - Name of the table to query
  * `query` (optional) - ServiceNow query string
  * `limit` (optional) - Maximum number of records to return
  * `offset` (optional) - Number of records to skip
  * `fields` (optional) - Comma-separated list of fields to return
  * `display_value` (optional) - Return display values instead of actual values
  * `exclude_reference_link` (optional) - Exclude reference links from response

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://table/get_record` - Get a single record by sys_id

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table_name` (required) - Name of the table
  * `sys_id` (required) - System ID of the record
  * `fields` (optional) - Comma-separated list of fields to return
  * `display_value` (optional) - Return display values instead of actual values
  * `exclude_reference_link` (optional) - Exclude reference links from response

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://table/create_record` - Create a new record

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table_name` (required) - Name of the table
  * `data` (required) - Hash of field names and values for the new record
  * `display_value` (optional) - Return display values in response
  * `exclude_reference_link` (optional) - Exclude reference links from response
  * `input_display_value` (optional) - Treat input values as display values

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://table/update_record` - Update a record (replace all fields)

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table_name` (required) - Name of the table
  * `sys_id` (required) - System ID of the record to update
  * `data` (required) - Hash of field names and values
  * `display_value` (optional) - Return display values in response
  * `exclude_reference_link` (optional) - Exclude reference links from response
  * `input_display_value` (optional) - Treat input values as display values

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://table/patch_record` - Patch a record (update specific fields)

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table_name` (required) - Name of the table
  * `sys_id` (required) - System ID of the record to update
  * `data` (required) - Hash of field names and values to update
  * `display_value` (optional) - Return display values in response
  * `exclude_reference_link` (optional) - Exclude reference links from response
  * `input_display_value` (optional) - Treat input values as display values

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://table/delete_record` - Delete a record

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `table_name` (required) - Name of the table
  * `sys_id` (required) - System ID of the record to delete

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

### OAuth Methods

* `servicenow://oauth/token` - Get OAuth access token

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `grant_type` (optional) - OAuth grant type
  * `client_id` (optional) - OAuth client ID
  * `scope` (optional) - OAuth scope

  Credentials:
  * `username`/`password` - For password grant type
  * `client_secret` - OAuth client secret
  * `refresh_token` - For refresh token grant type

### Service Catalog Methods

* `servicenow://service_catalog/submit_catalog_item` - Submit a catalog item order

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `item_sys_id` (required) - System ID of the catalog item
  * `variables` (optional) - Hash of variable names and values for the order

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_request` - Get a service catalog request

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `request_id` (required) - ID of the request

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_requested_item` - Get a requested catalog item

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `requested_item_id` (required) - ID of the requested item

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_catalogs` - Get all service catalogs

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_catalog` - Get a specific service catalog

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `catalog_id` (required) - ID of the catalog

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_categories` - Get all service catalog categories

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_category` - Get a specific service catalog category

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `category_id` (required) - ID of the category

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_items` - Get all catalog items

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_item` - Get a specific catalog item

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `item_id` (required) - ID of the catalog item

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/search_items` - Search for catalog items

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `search_term` (required) - Search term

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/get_cart` - Get the shopping cart

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/add_to_cart` - Add a catalog item to the cart

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `item_id` (required) - ID of the catalog item to add
  * `cart_id` (optional) - ID of the cart, defaults to "default"
  * `quantity` (optional) - Quantity to add
  * `variables` (optional) - Hash of variable names and values

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/update_cart_item` - Update an item in the cart

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `cart_item_id` (required) - ID of the cart item to update
  * `cart_id` (optional) - ID of the cart, defaults to "default"
  * `quantity` (optional) - New quantity
  * `variables` (optional) - Hash of variable names and values

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/remove_from_cart` - Remove an item from the cart

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `cart_item_id` (required) - ID of the cart item to remove
  * `cart_id` (optional) - ID of the cart, defaults to "default"

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/empty_cart` - Empty the shopping cart

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `cart_id` (optional) - ID of the cart, defaults to "default"

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/checkout_cart` - Checkout the shopping cart

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `cart_id` (optional) - ID of the cart
  * `special_instructions` (optional) - Special instructions for the order

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication

* `servicenow://service_catalog/submit_order` - Submit an order from the cart

  Parameters:
  * `instance_id` (required) - ServiceNow instance identifier
  * `cart_id` (optional) - ID of the cart
  * `requested_for` (optional) - User for whom the order is requested

  Credentials:
  * `username`/`password` - Basic authentication credentials
  * OR `access_token` - OAuth access token for Bearer authentication
