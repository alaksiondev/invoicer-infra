# How to run your local instance of the Invoicer System

### Requirements
- Docker CLI


## Default ports used by Invoicer
If you are to use the default port configuration please assure the following ports are not in use:

- 8080: Instance 1 of the Invoicer Ktor API
- 8081: Instance 2 of the Invoicer Ktor API
- 5432: Postgre Database
- 6379: Redis Database
- 9090: Prometheus
- 3000: Grafana
- 4000: Nginx
- 9200: ElasticSearch
- 5000: Logstash
- 5601: Kibana

## Environment Variables
Invoicer infrastructure is powered by a DockerCompose file and some configurations have been moved into env variables. To ensure the deploy works as expected be sure to setup the following env:

```yml
# Database connection
INVOICER_DB_USERNAME=
INVOICER_DB_PASSWORD=
INVOICER_DB_NAME=
INVOICER_DB_URL=
INVOICER_API_PORT= # Be sure this value is equal to the container port used by the API instances

# JWT Configuration
INVOICER_JWT_AUDIENCE=
INVOICER_JWT_ISSUER=
INVOICER_JWT_SECRET=
INVOICER_JWT_REALM=
#Redis configuration
INVOICER_REDIS_HOST=
INVOICER_REDIS_PORT=
INVOICER_REDIS_TTL=
```
Use this default schema for convenience

```yml
export INVOICER_DB_USERNAME=invoicerDev
export INVOICER_DB_PASSWORD=6b9364d4-0f75-47dd-bb5a-4fd4bd51c631
export INVOICER_DB_NAME=postgres
export INVOICER_DB_URL=jdbc:postgresql://invoicer-database:5432/postgres
export INVOICER_JWT_AUDIENCE=sample_audience
export INVOICER_JWT_ISSUER=sample_issuer
export INVOICER_JWT_SECRET=sample_secret
export INVOICER_JWT_REALM=invoicer
export INVOICER_REDIS_HOST=invoicer-redis
export INVOICER_REDIS_PORT=6379
export INVOICER_REDIS_TTL=3600000
export INVOICER_API_PORT=8080
```

## Deploy the system
1. Clone this repository
2. CD into the cloned directory
3. type `docker compose up`
4. Wait for docker to start the services
5. Have fun
