## **启动 SQL\*Plus 并连接到默认数据库**

```
# 启动sql*plus 按提示输入用户名和密码
sqlplus
# 启动sql*plus 按提示输入密码
sqlplus username
# 启动 并连接到指定数据库 按提示输入密码
sqlplus username@connect_identifier
```

查看是否有demo 文件脚本

```
$ORACLE_HOME/demo/schema/human_resources/hr_main.sql
```

## 连接到其他数据库

```
SQL> connect username@connect_identifier
```

运行hr脚本

```plsql
#默认回车 即可
@?/demo/schema/human_resources/hr_main.sql
```

运行第一个查询

```plsql
DESCRIBE EMP_DETAILS_VIEW
```

```plsql
#解锁 HR 帐户
ALTER USER HR IDENTIFIED BY oracle23 ACCOUNT UNLOCK;
```



```plsql
COLUMN FIRST_NAME HEADING "First Name"
COLUMN LAST_NAME HEADING "Family Name"
SELECT FIRST_NAME, LAST_NAME
FROM EMP_DETAILS_VIEW
WHERE LAST_NAME LIKE 'K%';
```

