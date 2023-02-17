## Active queries:
```sql
select sql_id from gv$session where username='INFAPPUSR' and status='ACTIVE';
```
 

 

## SQL Plans:
```sql
select * from table(dbms_xplan.display_awr('SQL_ID','PLAN_HASH_VALUE'));
```
 
```sql
SELECT  * FROM table(DBMS_XPLAN.DISPLAY_CURSOR(SQL_ID=>'$SQL_ID', *FORMAT=>'all'));
```
 
```
select s.sql_id, s.plan_hash_value,s.SQL_PROFILE,s.FIRST_LOAD_TIME,s.EXECUTIONS, s.*, s.SQL_PROFILE from v$sqlarea s where 1=1

and s.PARSING_SCHEMA_NAME = 'INFAPP'

--sql_id = :1

and s.sql_fulltext like '%'
```
 
```sql
SELECT plan_hash_value,

       elapsed_time_total,executions_total

  FROM dba_hist_sqlstat

WHERE sql_id = TRIM(:1)

   AND executions_total > 0

   order by plan_hash_value;
```
 

```sql
select * from table(dbms_xplan.display_awr(:1));
```
``sql
select * from dba_hist_sql_plan where sql_id = :1 order by timestamp desc;
```
```sql
select * from dba_hist_sqlstat where sql_id = :1 order by rows_processed_total desc, elapsed_time_total, snap_id desc;
```
 


```sql
WITH

p AS (

SELECT plan_hash_value

  FROM gv$sql_plan

WHERE sql_id = TRIM(:1)

   AND other_xml IS NOT NULL

UNION

SELECT plan_hash_value

  FROM dba_hist_sql_plan

WHERE sql_id = TRIM(:1)

   AND other_xml IS NOT NULL ),

m AS (

SELECT plan_hash_value,

       SUM(elapsed_time)/SUM(executions) avg_et_secs

  FROM gv$sql

WHERE sql_id = TRIM(:1)

   AND executions > 0

GROUP BY

       plan_hash_value ),

a AS (

SELECT plan_hash_value,

       SUM(elapsed_time_total)/SUM(executions_total) avg_et_secs

  FROM dba_hist_sqlstat

WHERE sql_id = TRIM(:1)

   AND executions_total > 0

GROUP BY

       plan_hash_value )

SELECT p.plan_hash_value,

       ROUND(NVL(m.avg_et_secs, a.avg_et_secs)/1e6, 3) avg_et_secs

  FROM p, m, a

WHERE p.plan_hash_value = m.plan_hash_value(+)

   AND p.plan_hash_value = a.plan_hash_value(+)

ORDER BY

       avg_et_secs NULLS LAST;
```
 

## Locks check 
```sql
select * from v$lock;
```
 
```sql
select * from v$locked_object;
```

```sql
select * from gv$session where sid = '2627';
```
 
```sql
select

c.owner,

c.object_name,

c.OBJECT_TYPE,

b.sid,

b.serial#,

b.status,

b.osuser,

b.machine

from dba_objects c, v$locked_object a, v$session b

where b.sid = a.session_id

and a.object_id = c.object_id;
```
 
## Index check
```sql
Select owner,index_name,status

from

(

Select owner,index_name,status from dba_indexes union all

Select index_owner,index_name,status from dba_ind_partitions union all

Select index_owner,index_name,status from dba_ind_subpartitions

)

Where status not in('VALID','N/A','USABLE');
```
 

# UUID
```sql
select regexp_replace(rawtohex(sys_guid())

                     , '([A-F0-9]{8})([A-F0-9]{4})([A-F0-9]{4})([A-F0-9]{4})([A-F0-9]{12})'

                     , '\1-\2-\3-\4-\5')

                     as FORMATTED_GUID

          from dual;
```
