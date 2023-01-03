-- Purpose: Setup new redshift database for dbt demo
-- Author: Gary A. Stafford
-- Date: 2022-12-29

-- optional: drop previous demo
drop database demo;

-- optional: drop previous user
drop user dbt;

-- optional: drop previous group
drop group dbt

-- create new database
create database demo with owner admin;

-- switch redshift database connection to new demo database before continuing!

-- create external tables schema and new glue data catalog
create external schema tickit_external
from data catalog
database 'tickit_dbt'
iam_role 'arn:aws:iam::<your_aws_acccount_id>:role/ClusterPermissionsRole'
create external database if not exists;

create schema tickit_dbt;

drop schema public;

-- create dbt user and group
create user dbt with password 'CHANGE_ME!'
    nocreatedb nocreateuser syslog access restricted
    connection limit 10;

-- create dbt group
create group dbt with user dbt;

-- grants on tickit_external schema
grant usage on schema tickit_external to group dbt;
grant create on schema tickit_external to group dbt;
grant all on all tables in schema tickit_external to group dbt;

-- grants on tickit_dbt schema
grant usage on schema tickit_dbt to group dbt;
grant create on schema tickit_dbt to group dbt;
grant all on all tables in schema tickit_dbt to group dbt;

-- reassign schema ownership to dbt
alter schema tickit_dbt owner to dbt;
alter schema tickit_external owner to dbt;
