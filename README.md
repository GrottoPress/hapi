# Hapi

*Hapi* is a low-level API client architecture for [*Crystal*](https://crystal-lang.org), specifically for JSON REST APIs. *Hapi* revolves around the following concepts:

1. ### Resource:

   A *Resource* represents a JSON-serializable object that can be retrieved in responses from the API server.

1. ### Client:

   A *Client* is responsible for querying all *resource* *endpoint*s, and returning responses from the API server.

1. ### Endpoint

   An *Endpoint* is a queryable path exposed by the API server, that returns a response. In *Hapi*, an endpoint represents a single resource endpoint, with methods that operate on its individual sub-endpoints.

## Usage

See `spec/support/` directory of this repository for example usage.

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
