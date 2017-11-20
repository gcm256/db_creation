connect SYS/change_on_install as SYSDBA
set echo on
spool /user/Home1/assistants/dbca/logs/CreateDB.log
startup nomount pfile="/user/Home1/admin/pp92d/scripts/init.ora";

CREATE DATABASE pp92d
controlfile reuse
logfile '/user/Home1/oradata/pp92d/redo01.log' size 1M reuse,
        '/user/Home1/oradata/pp92d/redo02.log' size 1M reuse,
        '/user/Home1/oradata/pp92d/redo03.log' size 1M reuse,
        '/user/Home1/oradata/pp92d/redo04.log' size 1M reuse
DATAFILE '/user/Home1/oradata/pp92d/system01.dbf' SIZE 10M REUSE
  AUTOEXTEND ON 
  NEXT 10M MAXSIZE 200M
CHARACTER SET WE8ISO8859P1;

create rollback segment rb_temp storage(initial 100k next 250k);
alter rollback segment rb_temp online;

create tablespace rbs
  datafile '/user/Home1/oradata/pp92d/rbs01.dbf' size 5M reuse AUTOEXTEND ON NEXT 5M MAXSIZE 150M;

create tablespace users
  datafile '/user/Home1/oradata/pp92d/users01.dbf' size 3M reuse AUTOEXTEND ON NEXT 5M MAXSIZE 150M;

create tablespace temp
  datafile '/user/Home1/oradata/pp92d/temp01.dbf' size 2M reuse AUTOEXTEND ON NEXT 5M MAXSIZE 150M;

create rollback segment rb1 storage(initial 50k next 250k) tablespace rbs;
create rollback segment rb2 storage(initial 50k next 250k) tablespace rbs;
create rollback segment rb3 storage(initial 50k next 250k) tablespace rbs;
create rollback segment rb4 storage(initial 50k next 250k) tablespace rbs;

alter rollback segment rb1 online;
alter rollback segment rb2 online;
alter rollback segment rb3 online;
alter rollback segment rb4 online;
alter rollback segment rb_temp offline;
drop rollback segment rb_temp;

spool off
exit;
