# Turret

![Continuous Integration](https://github.com/rosswilson/turret-elixir/workflows/Continuous%20Integration/badge.svg)

An identity and access management service using [Elixir](https://elixir-lang.org/) and [Phoenix Framework](https://www.phoenixframework.org/).

![](./docs/images/scott-webb-unsplash.jpg)

## Docker Quick Start

If you just want to try this out, the easiest way is using Docker.

1. Clone this repo:

   `git clone git@github.com:rosswilson/turret-elixir.git && cd turret-elixir`

1. Create a `.env` file with a long secret, this will be used to sign the session cookies:

   `echo "SECRET_KEY_BASE=$(openssl rand -hex 32)" > .env`

1. Generate a certificate to support HTTPS:

   `mkcert -cert-file priv/cert/selfsigned.pem --key-file priv/cert/selfsigned_key.pem localhost`

1. Start the various Docker containers:

   `docker-compose up`

1. In another terminal window, migrate the database:

   `docker-compose run web eval Turret.Release.migrate`

1. Now open [https://localhost:4000/](https://localhost:4000/) in your browser.

## Development

To start the application for development purposes:

- Generate local development [HTTPS certificates](./docs/local_ssl.md)
- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `yarn install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`https://localhost:4000`](https://localhost:4000) from your browser.

## Architecture

TODO

- Elixir version

- System dependencies

- Configuration

- Database creation

- Database initialization

- Services (job queues, cache servers, search engines, etc.)

## Testing

TODO

- How to run the test suite

## Deployment

TODO

- Deployment instructions

## License

MIT, enjoy 👋

## Created By

Ross Wilson, [@rossalexwilson](https://twitter.com/rossalexwilson) on Twitter
