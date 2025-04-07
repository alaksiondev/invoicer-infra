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
- 9200: ElasticSearch (Will be removed soon)
- 5001: Logstash (Will be removed soon)
- 5601: Kibana (Will be removed soon)
- 19090: Kafka
- 8083: Kafa UI
- 9000, 9001: Min IO

## Environment Variables
Invoicer infrastructure is powered by a DockerCompose file and some configurations have been moved into env variables. To ensure the deploy works as expected be sure to setup the required envinroment variables.

For convenience paste the default configuration below into a `.env` file.

```yml
 INVOICER_DB_USERNAME=invoicerDev
 INVOICER_DB_PASSWORD=6b9364d4-0f75-47dd-bb5a-4fd4bd51c631
 INVOICER_DB_NAME=postgres
 INVOICER_DB_URL=jdbc:postgresql://invoicer-database:5432/postgres
 INVOICER_JWT_AUDIENCE=sample_audience
 INVOICER_JWT_ISSUER=sample_issuer
 INVOICER_JWT_SECRET=sample_secret
 INVOICER_JWT_REALM=invoicer
 INVOICER_REDIS_HOST=invoicer-redis
 INVOICER_REDIS_PORT=6379
 INVOICER_REDIS_TTL=3600000
 INVOICER_API_PORT=8080
 INVOICER_LOGSTASH="invoicer-logstash:5001"
 #MIN_IO
 MINIO_USER=invoicer
 MINIO_PASSWORD=6b9364d4-0f75-47dd-bb5a-4fd4bd51c631
 INVOICER_MIN_IO_ACCESS_KEY=YW8iWM4zvnYoniv6n3cO
 INVOICER_MIN_IO_SECRET_KEY=kcl16tB2HnbMR2PdLfWtU61kVKhHnvHPw3PRm0vu
 INVOICER_MIN_IO_BUCKET="invoice-pdfs"
 INVOICER_MIN_IO_URL="http://invoicer-minio:9000"
 #Kafka
INVOICER_KAFKA_BOOTSTRAP_SERVERS="invoicer-kafka:9092"
# Log
KAFKA_LOG_LEVEL="WARN"
NETTY_LOG_LEVEL="INFO"
JETTY_LOG_LEVEL="INFO"
```

## QuickStart
- Clone this repository
-  CD into the cloned directory
- ❗❗ IMPORTANT ❗❗
  - Go to `docker-compose.yml` file
  - Navigate to lines 184 and 185
  - Replace `192.168.0.205` with the local IPv4 of your local machine
5. type `docker compose up`
6. Wait for docker to start the services
7. Have fun
