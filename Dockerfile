FROM gradle:7.5.1 AS base

WORKDIR /tabletennisapp
# Better practice might be to copy specific files rather than
# relying on the .dockerignore blacklist
COPY . .

RUN ./gradlew build

FROM base AS dev
ENTRYPOINT ./gradlew run --console=plain --debug

FROM base AS prod
ENTRYPOINT ./gradlew run --console=plain

FROM base AS test
ENTRYPOINT ./gradlew test --console=plain
