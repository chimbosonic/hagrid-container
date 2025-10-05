FROM rust:slim

RUN apt-get update -y && apt-get install -y build-essential pkg-config clang libclang-dev libssl-dev libsqlite3-dev gettext zsh git

WORKDIR /build
RUN git clone https://gitlab.com/hagrid-keyserver/hagrid.git

WORKDIR /build/hagrid
RUN cargo build --release

FROM rust:slim

RUN apt-get update -y && apt-get install -y gettext sqlite3
RUN mkdir -p /hagrid_template/ && mkdir -p /var/lib/hagrid/

COPY --from=0 /build/hagrid/target/release/hagrid /usr/local/bin/hagrid
COPY --from=0 /build/hagrid/Rocket.toml.dist /hagrid_template/Rocket.toml
COPY --from=0 /build/hagrid/dist/ /hagrid_template/

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/lib/hagrid

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
