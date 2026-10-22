FROM docker.io/oraclelinux:9
LABEL maintainer="Felipe Raposo <feliperaposo@gmail.com>"
# No Oracle Linux o $releasever_minor fica vazio; o repositorio PGDG passa a usar os diretorios por versao principal (rhel-9-x86_64).
RUN curl -o /etc/yum.repos.d/mssql-release.repo https://packages.microsoft.com/config/rhel/9/prod.repo && \
    dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm && \
    sed -i 's/\$releasever_major\.\$releasever_minor/$releasever_major/g' /etc/yum.repos.d/pgdg-redhat-all.repo && \
    dnf -y update && \
    ACCEPT_EULA=Y dnf install -y unixODBC postgresql18-odbc msodbcsql18 && \
    dnf clean all
EXPOSE 7890/tcp 7891/tcp
COPY ./root/ /
RUN cat /etc/odbcinst_psql.ini >> /etc/odbcinst.ini && \
    rm -f /etc/odbcinst_psql.ini
CMD ["/dbaccess.sh"]
