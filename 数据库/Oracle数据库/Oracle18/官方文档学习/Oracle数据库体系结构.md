## 体系结构概述

- [数据库服务器](https://www.oracle.com/webfolder/technetwork/tutorials/architecture-diagrams/18/technical-architecture/database-technical-architecture.html#)

An Oracle Database consists of at least one database instance and one database. The database instance handles memory and processes. The database consists of physical files called data files, and can be a non-container database or a multitenant container database. An Oracle Database also uses several database system files during its operation.

A single-instance database architecture consists of one database instance and one database. A one-to-one relationship exists between the database and the database instance. Multiple single-instance databases can be installed on the same server machine. There are separate database instances for each database. This configuration is useful to run different versions of Oracle Database on the same machine.

An Oracle Real Application Clusters (Oracle RAC) database architecture consists of multiple instances that run on separate server machines. All of them share the same database. The cluster of server machines appear as a single server on one end, and end users and applications on the other end. This configuration is designed for high availability, scalability, and high-end performance.

The listener is a database server process. It receives client requests, establishes a connection to the database instance, and then hands over the client connection to the server process. The listener can run locally on the database server or run remotely. Typical Oracle RAC environments are run remotely.



## Oracle数据库连接

## 实例内存区





## 后台进程



## 物理结构

### 数据文件

### 日志文件

### 控制文件

### 参数文件

### 其他文件

## 逻辑结构

### 表空间

### 段

### 数据区

### 数据块