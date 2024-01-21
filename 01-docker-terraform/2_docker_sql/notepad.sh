docker run -it \
-e POSTGRES_USER=shumengshi \
-e POSTGRES_PASSWORD=Ssm19960319 \
-e POSTGRES_DB=ny_taxi \
-v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
-p 5432:5432 \
—network=pg-network\
—name=pg-database\
postgres:13


docker run -it \
-e POSTGRES_USER=shumengshi \
-e POSTGRES_PASSWORD=Ssm19960319 \
-e POSTGRES_DB=ny_taxi \
-v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
-p 5432:5432 \
--network=pg-network \
--name=pg-database \
postgres:13


docker run -it \
-e PGADMIN_DEFAULT_EMAIL=shumeng.shi9@gmail.com \
-e PGADMIN_DEFAULT_PASSWORD=Ssm19960319 \
-p 8080:80 \
--network=pg-network \
--name=pg-admin \
dpage/pgadmin4