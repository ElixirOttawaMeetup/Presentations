FROM elixir:1.5

# Install local Elixir hex and rebar
RUN /usr/local/bin/mix local.hex --force
RUN /usr/local/bin/mix local.rebar --force 

# Set proper time-zone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app
ENV NODE_NAME 'bank@bank'
ENV NODE_COOKIE bank

COPY mix.exs /app
COPY config /app/config
COPY lib /app/lib
COPY rel /app/rel
RUN ["mix", "deps.get"]
RUN ["mix", "deps.compile", "commanded", "--force"]

RUN ["mix", "compile"]

CMD mix deps.get; iex -S mix

