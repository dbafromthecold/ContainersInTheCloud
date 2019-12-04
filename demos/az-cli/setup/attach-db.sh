sleep 15s

/opt/mssql-tools/bin/sqlcmd -S . -U sa -P Testing1122 \
-Q "CREATE DATABASE [TestDatabase] ON (FILENAME = '/var/opt/sqlserver/TestDatabase.mdf'),(FILENAME = '/var/opt/sqlserver/TestDatabase_log.ldf') FOR ATTACH"