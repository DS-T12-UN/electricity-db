FROM mysql:8.0.19

# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./sql/script/SQL_script.sql /docker-entrypoint-initdb.d/