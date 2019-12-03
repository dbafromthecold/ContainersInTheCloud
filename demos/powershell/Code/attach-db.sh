sleep 10s

/opt/mssql-tools/bin/sqlcmd -S . -U sa -P Testing1122 \
-Q "CREATE DATABASE [DatabaseA] ON (FILENAME = '/var/opt/sqlserver/DatabaseA.mdf'),(FILENAME = '/var/opt/sqlserver/DatabaseA_log.ldf') FOR ATTACH"