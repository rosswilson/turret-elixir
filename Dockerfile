FROM elixir:1.11.3-alpine AS build

# Install build dependencies
RUN apk add --no-cache build-base npm git

# Prepare build directory
WORKDIR /app

# Install hex + rebar
RUN mix local.hex --force && \
  mix local.rebar --force

# Install Yarn
RUN npm install -g yarn

# Set the build environment
ENV MIX_ENV=prod

# Install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix do deps.get, deps.compile

# Build static assets
COPY assets/package.json assets/yarn.lock ./assets/
RUN yarn --cwd ./assets install --frozen-lockfile

COPY priv priv
COPY assets assets
RUN yarn --cwd ./assets deploy
RUN mix phx.digest

# Compile and build an Elixir release
COPY lib lib
RUN mix do compile, release

# Prepare runtime image
FROM alpine:3.9 AS app
RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app

# Minimise the runtime permissions
USER nobody:nobody

# Copy the Elixir release directory
COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/turret ./

ENV HOME=/app

EXPOSE 4000

ENTRYPOINT [ "bin/turret" ]

# Run the Elixir release binary
CMD [ "start" ]
