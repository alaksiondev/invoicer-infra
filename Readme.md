# How to run your local instance of the Invoicer System

### Requirements
- Docker CLI
- Firebase Project


## Default ports used by Invoicer
If you are to use the default port configuration please assure the following ports are not in use:

- 8080: Instance 1 of the Invoicer Ktor API
- 8081: Instance 2 of the Invoicer Ktor API
- 5432: Postgre Database
- 6379: Redis Database
- 9090: Prometheus
- 3000: Grafana
- 4000: Nginx
- 3100: Loki
- 19090: Kafka
- 8083: Kafa UI
- 9000,
- 9001: Min IO

## Environment Variables
Invoicer infrastructure is powered by a DockerCompose file and most configurations have been moved into env variables. To ensure the deploy works as expected be sure to setup the required envinroment variables.

For convenience paste the default configuration below into a `.env` file.

```yml
 # SERVICE
 INVOICER_DB_USERNAME=invoicerDev
 INVOICER_DB_PASSWORD=6b9364d4-0f75-47dd-bb5a-4fd4bd51c631
 INVOICER_DB_NAME=postgres
 INVOICER_JWT_AUDIENCE=sample_audience
 INVOICER_JWT_ISSUER=sample_issuer
 INVOICER_JWT_SECRET=sample_secret
 INVOICER_JWT_REALM=invoicer
 INVOICER_REDIS_HOST=invoicer-redis
 INVOICER_MIN_IO_ACCESS_KEY=YW8iWM4zvnYoniv6n3cO
 INVOICER_MIN_IO_SECRET_KEY=kcl16tB2HnbMR2PdLfWtU61kVKhHnvHPw3PRm0vu
 INVOICER_MIN_IO_BUCKET="invoice-pdfs"
 #MIN_IO
 MINIO_USER=invoicer
 MINIO_PASSWORD=6b9364d4-0f75-47dd-bb5a-4fd4bd51c631
 #Kafka
KAFKA_EXTERNAL_URL="192.168.0.205:19090"
INVOICER_FIREBASE_PROJECT_ID="your-project-id-here"
```

## QuickStart

### Container setup
1. Clone this repository
2. CD into the cloned directory
3. Populate environment variables
4. Set MinIO access key and secret key. To do this navigate to localhost:9001, login using MIN_USER and MIN_PASSWORD previously set in the env variables, go to "Access Keys", and create a new access key using INVOICER_MIN_IO_ACCESS_KEY and INVOICER_MIN_IO_SECRET_KEY as values.

### Firebase Setup
1. Create a new firebase project
2. On Authentication section allow Google Sign in method
3. Go to settings > Service Accounts > Create new private key. Download the file, rename it to `firebase-credentials.json`, and copy it to `invoicer/configs`. Your project should look like `invoicer/configs/firebase-credentials.json`.
4. Go to settings -> General. Copy `project id` and set it as `INVOICER_FIREBASE_PROJECT_ID` variable.

### Last steps
1. type `docker compose up`
2. Wait for docker to start the services
3. Have fun
