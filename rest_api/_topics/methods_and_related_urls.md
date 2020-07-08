#### Methods and related URLs

The basic HTTP Methods used for the API are GET, POST, PUT, PATCH and
DELETE.

| URL                         | Semantic                                          |
| --------------------------- | ------------------------------------------------- |
| GET /api/:collection        | Return all resources of the collection            |
| GET /api/:collection/:id    | Return the specific resource                      |
| POST /api/:collection       | Create a resource in the collection               |
| POST /api/:collection/:id   | Perform an Action on a resource in the collection |
| PUT /api/:collection/:id    | Update a specific resource                        |
| PATCH /api/:collection/:id  | Update a specific resource                        |
| DELETE /api/:collection/:id | Delete a specific resource                        |

`:collection` represents specific entities such as services, hosts, and
virtual machines.
