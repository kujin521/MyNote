官方示例代码:https://github.com/oracle/oracle-db-examples

# **甲骨文JDBC精简驱动程序**

使用ojdbc8.jar 驱动连接Oracle

> 修改host地址 端口port 服务名service_name
>
> username password

官方翻译

> Oracle 建议在大多数要求下使用 JDBC 精简驱动程序。JDBC 精简驱动程序将在具有合适 Java 虚拟机的任何系统上工作。（JVM）。Oracle 提供的其他一些客户端驱动程序是 JDBC 精简驱动程序、Oracle 呼叫接口 （OCI） 驱动程序、服务器端精简驱动程序和服务器端内部驱动程序。
>
> JDBC 精简驱动程序是纯 Java，IV 型驱动程序。JDBC 驱动程序版本 /ojdbc8.jar） 对 JDK 8 的插曲支持。
>
> JDBC 精简驱动程序使用 SQL*Net 与服务器通信以访问数据库。

```java
package com.demo1;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DatabaseMetaData;

import oracle.jdbc.pool.OracleDataSource;
import oracle.jdbc.OracleConnection;

public class DataSourceSample {
    // The recommended format of a connection URL is the long format with the
    // connection descriptor.
    // final static String DB_URL= "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(HOST=myhost)(PORT=1521)(PROTOCOL=tcp))(CONNECT_DATA=(SERVICE_NAME=myorcldbservicename)))";

    final static String DB_URL= "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(HOST=192.168.21.129)(PORT=1521)(PROTOCOL=tcp))(CONNECT_DATA=(SERVICE_NAME=orcl)))";
    final static String DB_USER = "system";
    final static String DB_PASSWORD = "oracle123";

    public static void main (String args[]) throws SQLException {

        OracleDataSource ods = new OracleDataSource();
        ods.setURL(DB_URL);
        ods.setUser(DB_USER);
        ods.setPassword(DB_PASSWORD);

        // With AutoCloseable, the connection is closed automatically.
        try (OracleConnection connection = (OracleConnection)
                ods.getConnection()) {
            // Get the JDBC driver name and version
            DatabaseMetaData dbmd = connection.getMetaData();
            System.out.println("Driver Name: " + dbmd.getDriverName());
            System.out.println("Driver Version: " +
                    dbmd.getDriverVersion());
            System.out.println("Database Username is: " +
                    connection.getUserName());
        }
    }
}
```

# 通用连接池

### Universal Connection Pool

Connection pools help improve performance by reusing connection objects and reducing the number of times that connection objects are created.

Oracle Universal Connection Pool (UCP) is a feature rich Java connection pool that provides connection pool functionalities, along with high availability, scalability and load balancing with the help of tighter integration with Oracle Database configurations.

A Java application or container must have in their classpath, along with the (JDK8), to be able to use UCP. `ucp.jar``ojdbc8.jar`

翻译:

> ### 通用连接池
>
> 连接池通过重用连接对象和减少创建连接对象的时间来帮助提高性能。
>
> Oracle 通用连接池 （UCP） 是一个功能丰富的 Java 连接池，提供连接池功能，以及高可用性、可扩展性和负载平衡，并借助于与 Oracle 数据库配置进行更紧密的集成。
>
> Java 应用程序或容器必须具有其类路径（以及 （JDK8）才能使用 UCP。`ucp.jar``ojdbc8.jar`

```java
package com.demo1;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.ucp.jdbc.PoolDataSourceFactory;
import oracle.ucp.jdbc.PoolDataSource;

public class UCPSample {
    // final static String DB_URL=   "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(HOST=myhost)(PORT=1521)(PROTOCOL=tcp))(CONNECT_DATA=(SERVICE_NAME=myorcldbservicename)))";
    final static String DB_URL = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(HOST=192.168.21.129)(PORT=1521)(PROTOCOL=tcp))(CONNECT_DATA=(SERVICE_NAME=orcl)))";

    final static String DB_USER = "system";
    final static String DB_PASSWORD = "oracle123";
    final static String CONN_FACTORY_CLASS_NAME = "oracle.jdbc.pool.OracleDataSource";

    /*
     * 示例将UCP演示为客户端连接池。
     */
    public static void main(String args[]) throws Exception {
        // 获取UCP的PoolDataSource
        PoolDataSource pds = PoolDataSourceFactory.getPoolDataSource();

        // 首先在所有其他属性之前设置连接工厂
        pds.setConnectionFactoryClassName(CONN_FACTORY_CLASS_NAME);
        pds.setURL(DB_URL);
        pds.setUser(DB_USER);
        pds.setPassword(DB_PASSWORD);
        pds.setConnectionPoolName("JDBC_UCP_POOL");

        // 默认值为0。设置启动UCP时要创建的初始连接数。
        pds.setInitialPoolSize(5);

        // 默认值为0。设置UCP在运行时维护的最小连接数。
        pds.setMinPoolSize(5);

        // 默认是整数。MAX_VALUE(2147483647)。设置连接池上允许的最大连接数。
        pds.setMaxPoolSize(20);

        // 默认是30秒。设置要执行的频率(以秒为单位)
        //超时属性。适用于
        // inactiveConnectionTimeout (int秒),
        // AbandonedConnectionTimeout &(秒)
        // TimeToLiveConnectionTimeout (int秒)。
        //有效值的范围从0到Integer.MAX_VALUE。
        pds.setTimeoutCheckInterval(5);

        // 默认值为0。设置连接池中保持可用连接的最大时间(以秒为单位)。
        pds.setInactiveConnectionTimeout(10);

        System.out.println("检出前可用的连接: "
                + pds.getAvailableConnectionsCount());
        System.out.println("签出前借用的连接: "
                + pds.getBorrowedConnectionsCount());
        // Get the database connection from UCP.
        try (Connection conn = pds.getConnection()) {
            System.out.println("检出后可用的连接: "
                    + pds.getAvailableConnectionsCount());
            System.out.println("检出后借用的连接: "
                    + pds.getBorrowedConnectionsCount());
            // Perform a database operation
            printEmployees(conn);
        } catch (SQLException e) {
            System.out.println("UCPSample - " + "SQLException occurred : "
                    + e.getMessage());
        }
        System.out.println("签入后可用的连接: "
                + pds.getAvailableConnectionsCount());
        System.out.println("在签入后借用连接: "
                + pds.getBorrowedConnectionsCount());
    }

    /*
     * 显示employee表中的first_name和last_name。
     */
    public static void printEmployees(Connection connection)
            throws SQLException {
        // 语句和结果集是自动关闭的。
        try (Statement statement = connection.createStatement()) {
            try (ResultSet resultSet = statement
                    .executeQuery("select first_name, last_name from employees")) {
                System.out.println("FIRST_NAME" + "  " + "LAST_NAME");
                System.out.println("---------------------");
                while (resultSet.next())
                    System.out.println(resultSet.getString(1) + " "
                            + resultSet.getString(2) + " ");
            }
        }
    }
}
```

