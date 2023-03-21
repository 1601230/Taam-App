FROM postgres:latest
ENV POSTGRES_USER taamapp
ENV POSTGRES_PASSWORD taamapp
ENV POSTGRES_DB TaamAppDB
COPY init.sql /docker-entrypoint-initdb.d/
VOLUME ["/var/lib/postgresql/data"]
CMD ["postgres"]