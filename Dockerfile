FROM rust:slim

COPY scripts/build.sh ./
RUN chmod +x ./build.sh && ./build.sh

FROM rust:slim

COPY scripts/install.sh ./

RUN chmod +x ./install.sh && ./install.sh

COPY --from=0 /build/hagrid/target/release/hagrid /usr/local/bin/hagrid
COPY --from=0 /build/hagrid/Rocket.toml.dist /hagrid_template/Rocket.toml
COPY --from=0 /build/hagrid/dist/ /hagrid_template/

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/lib/hagrid

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
