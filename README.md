# Hapi

*Hapi* is a low-level API client architecture for [*Crystal*](https://crystal-lang.org), specifically for JSON REST APIs. *Hapi* revolves around the following concepts:

1. ### Resource:

   A *Resource* represents a JSON-serializable object that can be retrieved in *response*s from the API server.

1. ### Client:

   A *Client* is responsible for querying all *resource* *endpoint*s, and returning *response*s from the API server.

1. ### Endpoint

   An *Endpoint* is a queryable path exposed by the API server, that returns a *response*. In *Hapi*, an endpoint represents a single resource endpoint, with methods that operate on its individual sub-endpoints.

1. ### Response:

   A *Response* is *Hapi*'s representation of the raw response body received from the API server. It is a type-safe wrapper around the JSON response object.

   A *Response* may be an *Item* (a single resource object), or a *List* (an array of resource objects)

## Usage

See `spec/support/` directory of this repository for example usage.

## Example Projects

The following *Crystal* libraries use *Hapi*:

- [Cryflare](https://github.com/GrottoPress/cryflare)
- [Haystack](https://github.com/GrottoPress/haystack)
- [Lester](https://github.com/GrottoPress/lester)

## Development

Run specs with `crystal spec`.

## Contributing

1. [Fork it](https://github.com/GrottoPress/hapi/fork)
1. Switch to the `master` branch: `git checkout master`
1. Create your feature branch: `git checkout -b my-new-feature`
1. Make your changes, updating changelog and documentation as appropriate.
1. Commit your changes: `git commit`
1. Push to the branch: `git push origin my-new-feature`
1. Submit a new *Pull Request* against the `GrottoPress:master` branch.
