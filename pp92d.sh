#!/bin/sh

mkdir /usr/Home1/admin/pp92d/bdump
mkdir /usr/Home1/admin/pp92d/cdump
mkdir /usr/Home1/admin/pp92d/create
mkdir /usr/Home1/admin/pp92d/pfile
mkdir /usr/Home1/admin/pp92d/udump
mkdir /usr/Home1/dbs
mkdir /usr/Home1/oradata/pp92d
setenv ORACLE_SID pp92d
echo Add this entry in the oratab: pp92d:/usr/Home1:Y
/user/Home1/bin/orapwd file=/user/Home1/dbs/orapwpp92d password=change_on_install
/user/Home1/bin/sqlplus /nolog @/user/Home1/admin/pp92d/scripts/CreateDB.sql
#/user/Home1/bin/sqlplus /nolog @/user/Home1/admin/pp92d/scripts/CreateDBFiles.sql
/user/Home1/bin/sqlplus /nolog @/user/Home1/admin/pp92d/scripts/CreateDBCatalog.sql
/user/Home1/bin/sqlplus /nolog @/user/Home1/admin/pp92d/scripts/postDBCreation.sql
